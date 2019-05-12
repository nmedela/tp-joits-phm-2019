db.createCollection('movies')
db.movies.save({movie: "La Momia", year:"1999",rating: 2, genre:"Terror", screenings: [{cinemaName: "Cinemark",date:ISODate("2019-05-11T01:00:00-03:00")},
{cinemaName: "Joyts",date:ISODate("2019-04-10T05:00:00-03:00")},{cinemaName: "Joyts",date:ISODate("2019-12-10T18:30:00-03:00")}
]},{movie: "Dragon ball super: Broly", year:"2019",rating: 5, genre:"Anime", screenings: [{cinemaName: "Cinemark",date:ISODate("2019-07-15T16:00:00-03:00")},
{cinemaName: "Cinemita",date:ISODate("2019-08-07T12:00:00-03:00")}
]})
