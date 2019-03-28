import Axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl + "/Movies"

export default class MovieService {

    getMoviesByName = async (searchText) => {
        try {
            let resp = await Axios.get(`${endpointURL}/Search/${searchText}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getRecommended = async () => {
        try {
            let resp = await Axios.get(`${endpointURL}/Recommended`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    getScreeningsForMovie = async (movie) => {
        try {
            let resp = await Axios.get(`${endpointURL}/${movie.id}/Screenings`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}