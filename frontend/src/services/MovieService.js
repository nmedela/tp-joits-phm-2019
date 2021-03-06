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

    getRecommended = async (id) => {
        try {
            let resp = await axios.get(`${endpointURL}/movies/recommended/${id} `);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getScreeningsForMovie = async (movie) => {
        try {
            // let resp = await axios.get(`${endpointURL}/movies/${movie.id}/screenings`);
            let resp = await axios.get(`${endpointURL}/movies/screenings`,{
                params:{
                    title:movie.title
                }
            });
            
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}