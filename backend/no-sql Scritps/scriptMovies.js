db.createCollection('movies')
db.movies.save({movie: "La Momia", screenings: [{cinemaName: "Cinemark",date:"2019-05-11T01:00:00-03:00"},
{cinemaName: "Cinemark",date:"2019-04-10T05:00:00-03:00"}
]})
