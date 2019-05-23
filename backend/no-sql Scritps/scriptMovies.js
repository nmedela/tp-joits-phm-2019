
//Query para buscar las peliculas que estan en determinado cine

db.movies.find({"screenings.cinemaName" : "Jardin Japones"}).pretty()

