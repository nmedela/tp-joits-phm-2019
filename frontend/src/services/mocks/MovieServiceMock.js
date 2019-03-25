import MovieService from './../MovieService';

const screenings = [
  { id: 1, date: "24/03/2019", time: "20:30", location: "San Martin" },
  { id: 2, date: "01/05/2019", time: "10:00", location: "San Martin" },
  { id: 3, date: "24/08/2019", time: "09:34", location: "Martinez" },
  { id: 4, date: "24/12/2019", time: "12:38", location: "Belgrano" }
];

const moviesStub = [
  { title: "Elmo en la escuela", date: "10/01/2018", rating: "🌟", genre: "Animated" },
  { title: "El viaje de Chihiro", date: "10/01/2018", rating: "🌟🌟", genre: "Animated" },
  { title: "Avengers 2000", date: "10/01/2018", rating: "🌟🌟🌟🌟", genre: "Animated" },
  { title: "Volver al futurock", date: "10/01/2018", rating: "🌟🌟🌟🌟🌟", genre: "Animated" },
  { title: "Dragon ball super: Broly", date: "10/01/2018", rating: "🌟🌟", genre: "Animated" }
];

export default class MovieServiceMock extends MovieService {
  getMoviesByName = async (searchText) => {
    const prom = new Promise((resolve, reject) => { resolve(moviesStub) })
    const resp = await prom;
    return resp;
  }

  getRecommended = async () => {
    const prom = new Promise((resolve, reject) => { resolve(moviesStub.filter((val, index) => index < 2)) });
    const resp = await prom;
    return resp;
  }

  getScreeningsForMovie = async (movie) => {
    const prom = new Promise((resolve, reject) => { resolve(screenings) });
    const resp = await prom;
    return resp;
  }
}
