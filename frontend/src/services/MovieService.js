import Axios from "axios";
import { baseURL } from "./config.js"

export default class MovieService{
    
    async getMoviesByName(searchText){
        try{
            let resp = await Axios.get(baseURL + "/Peliculas/" + searchText);
            return resp.data;
        }
        catch(exception){
            alert(exception.message);
        }        
    }

    async getRecommended(){
        try{
            let resp = await Axios.get(baseURL + "/Peliculas/Recomendadas/");
            return resp.data;
        }
        catch(exception){
            alert(exception.message);
        }        
    }
}