import api from "./baseApi";

async function getPlanets(props) {
  try {
    const response = await api.get("/planets");
    if (response.status === 200) {
      const planets = response.data;
      return {
        data: planets,
        status: true,
      };
    }

    return {
      data: response.data,
      status: false,
    };
  } catch (err) {
    throw err;
  }
}

export default getPlanets;
