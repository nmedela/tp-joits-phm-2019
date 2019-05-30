1) ~/data/

2) mkdir joits

3 ) mkdir cfg1 cfg2 shard1 shard2 repl1 repl2

4) 
sudo chmod 775 shard* cfg*
sudo chown -R `id -un` shard* cfg*


5) levantamos los servers de config
mongod --replSet rsConf --configsvr --port 26050 --logpath ~/data/joits/log.cfg1 --logappend --dbpath ~/data/joits/cfg1 --fork
mongod --replSet rsConf --configsvr --port 26051 --logpath ~/data/joits/log.cfg2 --logappend --dbpath ~/data/joits/cfg2 --fork


6) levantamos los shard de mongo
mongod --shardsvr --replSet shard1 --dbpath ~/data/joits/shard1 --logpath ~/data/joits/log.shard1 --port 27000 --fork --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard1 --dbpath ~/data/joits/repl1 --logpath ~/data/joits/log.repl1 --port 27001 --fork --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard2 --dbpath ~/data/joits/shard2 --logpath ~/data/joits/log.shard2 --port 27100 --fork --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard2 --dbpath ~/data/joits/repl2 --logpath ~/data/joits/log.repl2 --port 27101 --fork --logappend --smallfiles --oplogSize 50

Off topic : para ver los procesos es `ps -fe | grep mongo`


7 ) Entramos al config server que levantamos al principio : mongo --port 26050

Y corremos los siguientes comandos
```
cfg={_id:"rsConf",members:[{_id:0 ,host: "127.0.0.1:26050"}, {_id: 1, host: "127.0.0.1:26051" }], protocolVersion:1}
rs.initiate(cfg)
```

8 ) ahora configuramos los shards

Entramos al primero : `mongo --port 27000`

Corremos:
```
cfg={_id:"shard1", members:[{_id:0 ,host: "127.0.0.1:27000"}, {_id:1 ,host: "127.0.0.1:27001" }]}
rs.initiate(cfg)
rs.status()
```

Entramos al segundo : `mongo --port 27100`

Corremos:
```
cfg={_id:"shard2", members:[{_id:0 ,host: "127.0.0.1:27100"}, {_id:1 ,host: "127.0.0.1:27101" }]}
rs.initiate(cfg)
rs.status()
```

9 ) Levantamos nuestro servidor de ruteo

`mongos --configdb rsConf/127.0.0.1:26050,127.0.0.1:26051 --fork --logappend --logpath ~/data/mongodb/shardlog --port 28001 --bind_ip 127.0.0.1`
 
y nos conectamos : `mongo --port 28001`

10)

Agregamos nuestros shard a este router:
```
sh.addShard("shard1/127.0.0.1:27000")
sh.addShard("shard2/127.0.0.1:27100")
```

corremos `db.adminCommand( { listShards: 1 } )` para ver que tenemos los 2 shards realmente configurados 

Perfecto ya tenemos nuestro toda nuestra arquitectura corriendo.... y ahora ?

Creamos nuestra shardKey:
```
use joits

db.movies.ensureIndex({"title": "hashed"})

sh.enableSharding("joits")

sh.shardCollection("joits.movies", {"title": "hashed" }, false)

```

y vamos a popular los datos ! 

``` load('populate_movies') ```

para ver los datos dentro de cada shard
```
mongo --port 27000
use joits
db.movies.count()

```

Generando datos random

mgeneratejs '{
  "title": "$name",
  "className": "edu.unsam.joits.domain.MovieMongo",
  "rating": {
    "$integer": {
      "min": 0,
      "max": 5
    }
  },
  "genre": "Accion",
  "screenings": {
    "$array": {
      "of": {
        "date": {
            "dateFromString": {
            "dateString": "$date"
        }},
        "cinemaName": "$address"
      },
      "number": 3
    }
  }
}' -n 100000000 | mongoimport --uri mongodb://localhost:28001/joits --collection movies --mode insert
