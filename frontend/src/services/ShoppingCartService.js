import Axios from "axios";
import { baseUrl } from "./config";

const endpointURL = baseUrl + "/ShoppingCart"

export default class ShoppingCartService {

    async finalizarCompra(user) {
        try {
            let resp = await Axios.post(`${endpointURL}/${user.id}`, user.shoppingCart);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async getShoppingCart(userId) {
        try {
            let resp = await Axios.get(`${endpointURL}/${userId}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async updateShoppingCart(userId, shoppingCart) {
        try {
            let resp = await Axios.put(`${endpointURL}/${userId}`, shoppingCart);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}