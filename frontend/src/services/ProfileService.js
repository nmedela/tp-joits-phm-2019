import axios from "axios";
import { baseUrl } from "./config";

export default class ProfileService {
  static async getUserData(id) {
    const response = await axios.get(`${baseUrl}/user/${id}`);
    return response.data;
  }

  static async chargeMoney(id, amount) {
    const response = await axios.put(`${baseUrl}/user/${id}/cash`,{amount});
    return response.data
    // return Promise.resolve();
  }
  static modifyUser(user) {
    return Promise.resolve();
  }
  static async addFriend(id,friend) {
    const response = await axios.put(`${baseUrl}/user/${id}/friend`,{ ...friend });
    return response.data
  }
  static async searchFriends(id,searchFriends) {
    const response = await axios.get(`${baseUrl}/user/${id}/friends`,{params:{
      name:searchFriends
    }});
    return response.data
  }
  static async suggestedFriends(id) {
    const response = await axios.get(`${baseUrl}/user/${id}/friends/suggested`);
    return response.data
  }
}
