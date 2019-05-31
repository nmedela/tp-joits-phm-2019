/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CONSULTA 1 :
//db.movies.find({"screenings.cinemaName": "Cinemark"}).map((pelicula) => ({movie :pelicula.title}))
//db.movies.find({"screenings.cinemaName": "Cinemark"},{title: 1})

db.system.js.save(
{
   _id:"peliculasConFuncionesEnSala",
   value: function(sala){
       return db.movies.find({ "screenings.cinemaName" : sala },{title: 1}
       )}
}) 

db.loadServerScripts();
peliculasConFuncionesEnSala("Cinemark");
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Consulta 2 :

db.system.js.save(
{
   _id:"peliculasDeAnioEnMasDeUnaSala",
   value: function(anio){
      const cantidad = db.movies.find({$where: "this.screenings.length > 1 && this.year == " + anio }).count() 
      return "Hay " + cantidad + " peliculas del año " + anio + " que se reproducen en mas de una sala"
      }
}) 

db.loadServerScripts();
peliculasDeAnioEnMasDeUnaSala(1999);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


CONSULTA 3:
//db.movies.find({"screenings.date": {$gt: ISODate("2020-01-01")}}).map((pelicula) => ({movie :pelicula.title}))

//db.movies.find({"screenings.date": {$gt: ISODate("2019-01-01")}},{title: 1})

db.system.js.save(
{
   _id:"peliculasParaVerAPartirDeFecha",
   value: function(fecha){
       return db.movies.find({"screenings.date": {$gt: ISODate(fecha)}},{title: 1})
}
}) 

