import api from "./baseApi";

async function getPeople(props) {
  try {
    const response = await api.get("/people");
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

export default getPeople;
