import axios from "axios";

// ƯU TIÊN đọc từ window.ENV (runtime), fallback về import.meta.env (build time)
const baseURL = window.ENV?.API_URL || import.meta.env.VITE_API_URL || "http://localhost:8080";

console.log("API URL:huhuhuVITE", baseURL);

export default axios.create({
  baseURL,
  headers: {
    "Content-Type": "application/json",
  },
});
