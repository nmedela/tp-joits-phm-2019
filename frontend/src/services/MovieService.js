import Axios from "axios";
import { baseURL } from "./config.js"

export default class MovieService {

    getMoviesByName = async (searchText) => {
        try {
            let resp = await Axios.get(baseURL + "/Peliculas/" + searchText);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getRecommended = async () => {
        try {
            let resp = await Axios.get(baseURL + "/Peliculas/Recomendadas/");
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getScreeningsForMovie = async (movie) => {
        try {
            let resp = await Axios.get(baseURL + "/Peliculas/Funciones/" + movie.id);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}