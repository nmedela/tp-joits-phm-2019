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

    async getShoppingCart(user) {
        try {
            let resp = await Axios.put(`${endpointURL}/${user.id}`);
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }

    async updateShoppingCart(user, shoppingCart) {
        try {
            let resp = await Axios.put(`${endpointURL}/${user.id}`, { id: user.id, shoppingCart: shoppingCart });
            return resp.data;
        }
        catch (exception) {
            alert(exception.message);
        }
    }
}