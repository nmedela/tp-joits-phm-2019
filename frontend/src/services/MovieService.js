import axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl;

export default class MovieService {

    getMoviesByName = async (searchText) => {
        try {
            let resp = await axios.get(`${endpointURL}/movies`,{
                params:{
                    title:searchText
                }
            });
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getRecommended = async () => {
        try {
            let resp = await axios.get(`${endpointURL}/movies/recommended`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getScreeningsForMovie = async (movie) => {
        try {
            let resp = await axios.get(`${endpointURL}/movies/${movie.id}/screenings`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}