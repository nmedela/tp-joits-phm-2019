import axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl;

export default class ShoppingCartService {

    

    async getShoppingCart(userId) {
        try {
            let resp = await axios.get(`${endpointURL}/${userId}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async getShoppingCartDetails(userId) {
        const shoppingCart = JSON.parse(sessionStorage.getItem("tickets"));
        try {
            let resp = await axios.post(`${endpointURL}/shoppingcart/details`, {
                 tickets: !!shoppingCart ? shoppingCart : []
            });
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async updateShoppingCart(userId, shoppingCart) {
        const tickets = shoppingCart.map(ticket => ({movieId: ticket.movie.id, screeningId: ticket.screeningId}))
        sessionStorage.setItem("tickets",JSON.stringify(tickets));
    }
    async submitOrder(userId) {
        const shoppingCart = JSON.parse(sessionStorage.getItem("tickets"));
        try {
            let resp = await axios.post(`${endpointURL}/user/${userId}/shoppingcart`,{
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