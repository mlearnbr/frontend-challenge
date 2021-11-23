import api from "./baseApi";

async function getFilm(props) {
  try {
    const response = await api.get("/films");
    if (response.status === 200) {
      const films = response.data;
      return {
        data: films,
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

export default getFilm;
