import api from "./baseApi";

async function getSpecies(props) {
  try {
    const response = await api.get("/species");
    if (response.status === 200) {
      const people = response.data;
      return {
        data: people,
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

export default getSpecies;
