import axios from "axios";
import { baseUrl } from "./config";

export default class ProfileService {
  static async getUserData(id) {
    const response = await axios.get(`${baseUrl}/user/${id}`);
    return response.data;
  }
  static async getSeenMovies(id){
    const response = await axios.get(`${baseUrl}/user/${id}/movies/seen`);
    return response.data;
  }
  static async chargeMoney(id, amount) {
    const response = await axios.put(`${baseUrl}/user/${id}/cash`,{amount});
    return response.data
    // return Promise.resolve();
  }
  static async changeAge(id, age) {
    await axios.put(`${baseUrl}/user/${id}`,{age});
    // return Promise.resolve();
  }
  static async modifyUser(id,age) {
    await axios.put(`${baseUrl}/user/${id}`,{age});
  }
  static addFriend(friend) {
    return Promise.resolve();
  }
  static searchFriends(searchFriends) {
    return Promise.resolve([
      {
        name: "Gonzalo",
        lastname: "rodriguez"
      }
    ]);
  }
}
