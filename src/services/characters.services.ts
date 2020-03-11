import api from 'config/api';

class CharacterService {

  public getCharacters(page: number = 1) {
    return api.get(`people/?page=${page}`);
  }
}

export default new CharacterService();