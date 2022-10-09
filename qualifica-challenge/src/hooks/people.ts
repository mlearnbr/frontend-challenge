import { atom, useAtom } from 'jotai';
import { useState } from 'react';

import Api from '../service';
import { debounce } from '../util';

interface Result {
  name: string;
  height: string;
  mass: string;
  hair_color: string;
  skin_color: string;
  eye_color: string;
  birth_year: string;
  gender: string;
  homeworld: string;
  films: string[];
  species: string[];
  vehicles: string[];
  starships: string[];
  created: Date;
  edited: Date;
  url: string;
}

interface Data {
  count: number;
  next: string;
  previous?: any;
  results: Result[];
}

const charactersAtom = atom<Result[]>([]);
const searchAtom = atom('');

export const usePeople = () => {
  const [characters, setCharacters] = useAtom(charactersAtom);
  const [search, setSearch] = useAtom(searchAtom);

  const handleCharacter = async (value: string) => {
    const {
      data: { results },
    } = await Api.get(`/people/?search=${value}`);
    setCharacters(results);
  };

  const debounceChange = debounce(handleCharacter, 600);

  const handleSearch = (value: string) => {
    if (value !== '') {
      setSearch(value);
      debounceChange(value);
    } else {
      handleCharacters();
      setSearch('');
    }
  };

  const handleCharacters = async () => {
    const {
      data: { results },
    } = await Api.get<Data>(`/people/`);
    setCharacters(results);
  };

  return {
    handleCharacters,
    characters,
    handleSearch,
    search,
  };
};
