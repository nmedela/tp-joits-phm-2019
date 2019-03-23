import axios from "axios";
import { baseUrl } from "./config";
export default class LoginService {
  static login(userData) {
    return axios.post(`${baseUrl}/login`, { ...userData });
  }
}
