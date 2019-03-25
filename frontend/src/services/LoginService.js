import axios from "axios";
import { baseUrl } from "./config";
export default class LoginService {
  static async login(userData) {
    const response = await axios.post(`${baseUrl}/login`, { ...userData });
    return response.data;
  }
  static saveSession(id) {
    sessionStorage.setItem("id", id);
  }
  static getSession() {
    return sessionStorage.getItem("id");
  }
  static logout() {
    return sessionStorage.removeItem("id");
  }
}
