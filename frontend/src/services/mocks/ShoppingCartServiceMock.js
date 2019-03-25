
import ShoppingCartService from './../ShoppingCartService';

let shoppingCart = [1];

export default class ShoppingCartServiceMock extends ShoppingCartService {
  getShoppingCart = async (user) => {
    const prom = new Promise((resolve, reject) => { resolve(shoppingCart) })
    let resp = await prom;
    return resp;
  }

  updateShoppingCart = async (user, newShoppingCart) => {
    const prom = await new Promise((resolve, reject) => {
      shoppingCart = newShoppingCart;
      resolve(shoppingCart);
    });

    let resp = await prom;

    return resp;
  }

}