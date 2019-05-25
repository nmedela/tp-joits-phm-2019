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
        if(!shoppingCart)
            return;

        try {
            await axios.post(`${endpointURL}/user/${userId}/shoppingcart`, {tickets: shoppingCart});
        }
        catch(exception){
            alert(exception.message);
        }
    }
    
    async submitOrder(userId) {
        const shoppingCart = JSON.parse(sessionStorage.getItem("tickets"));
        try {
            let resp = await axios.post(`${endpointURL}/user/${userId}/shoppingcart/confirm`,{
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