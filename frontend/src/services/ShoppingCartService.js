import axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl;

export default class ShoppingCartService {

    async submitOrder(userId) {
        try {
            let resp = await axios.post(`${endpointURL}/${userId}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async getShoppingCart(userId) {
        try {
            let resp = await axios.get(`${endpointURL}/${userId}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async getShoppingCartDetails(userId,shoppingCart) {
        try {
            let resp = await axios.get(`${endpointURL}/${userId}/shoppingcart/detail`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async updateShoppingCart(userId, shoppingCart) {
        console.log("hola manolo");
        const tickets = shoppingCart.map(ticket => ({movieId: ticket.movie.id, screeningId: ticket.screeningId}))
        sessionStorage.setItem("tickets",JSON.stringify(tickets));
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