import api from 'config/api';

class CharacterService {

  public getCharacters(page: number = 1) {
    return api.get(`people/?page=${page}`);
  }

  public getCharacterById(id: string = '1') {
    return api.get(`people/${id}`);
  }
}

export default new CharacterService();