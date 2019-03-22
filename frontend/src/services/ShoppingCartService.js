import Axios from "axios";
import { baseURL } from "./config.js"

export default class ShoppingCartService{

    async finalizarCompra(user){
        try{
            let resp = await Axios.post(baseURL + "/Carrito/Submit", user.shoppingCart);
            return resp.data;
        }
        catch(exception){
            alert(exception.message);
        }
    }
}