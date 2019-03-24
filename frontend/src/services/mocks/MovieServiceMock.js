import MovieService from './../MovieService';

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
}
