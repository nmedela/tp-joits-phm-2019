import axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl;

export default class ShoppingCartService {

    

    async getShoppingCart(userId) {
        try {
            let resp = await axios.get(`${endpointURL}/user/${userId}/shoppingcart`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async getShoppingCartDetails(userId) {
        const shoppingCart = JSON.parse(sessionStorage.getItem("tickets"));
        try {
            let resp = await axios.get(`${endpointURL}/user/${userId}/shoppingcart`)
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async updateShoppingCart(userId, shoppingCart) {
        const tickets = shoppingCart.map(ticket => ({
            movieTitle: ticket.movie.title,
            movieGenre: ticket.movie.genre,
            movieRating: ticket.movie.rating,
            price: ticket.movie.price,
            date: ticket.screening.date,
            time: ticket.screening.time, 
            cinemaName:ticket.screening.cinemaName 
        }));
        try {
            await axios.post(`${endpointURL}/user/${userId}/shoppingcart`, {tickets});
        }
        catch(exception){
            alert(exception.message);
        }
    }
    
    async submitOrder(userId) {
        const shoppingCart = JSON.parse(sessionStorage.getItem("tickets"));
        try {
            let resp = await axios.put(`${endpointURL}/user/${userId}/shoppingcart`,{
                tickets:shoppingCart
            });
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async removeAll(userId) {
        try {
            let resp = await axios.delete(`${endpointURL}/${userId}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}