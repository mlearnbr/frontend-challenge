import axios from 'axios';

const Api = axios.create({
  baseURL: 'https://swapi.dev/api/',
});

export default Api;
