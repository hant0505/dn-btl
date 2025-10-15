import axios from "axios";

const baseURL = import.meta.env.VITE_API_URL;  // ✅ đúng cho Vite
console.log("API URL:huhuhuVITE", baseURL);

export default axios.create({
  baseURL,
  headers: {
    "Content-Type": "application/json",
  },
});
