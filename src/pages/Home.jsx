/* eslint-disable no-await-in-loop */
/* eslint-disable prefer-const */
import React, { useEffect, useState } from 'react';
import { Grid } from '@mui/material';
import axios from 'axios';
import { Container } from '@mui/system';
import CharacterCard from '../components/CharacterCard';
import Skeletons from '../components/Skeletons';

function Home() {
  const [characters, setCharacters] = useState([]);

  // referência https://stackoverflow.com/questions/71726702/swapi-pagination-with-node-js-express-and-axios
  const getCharacters = async () => {
    let nextPage = 'https://swapi.dev/api/people/';
    let people = [];
    while (nextPage) {
      let nextResponse = await axios(nextPage);
      const { next, results } = await nextResponse.data;
      nextPage = next;
      people = [...people, ...results];
    }
    setCharacters(people);
  };

  useEffect(() => {
    getCharacters();
  }, []);

  return (
    <div>
      <Container maxWidth="xl">
        <Grid container spacing={3}>
          {characters.length === 0 ? (
            <Skeletons />
          ) : (
            characters.map((character, index) => (
              <Grid item xs={12} sm={6} md={4} lg={2} key={character.created}>
                <CharacterCard
                  key={character.created}
                  index={index + 1}
                  character={character}
                />
              </Grid>
            ))
          )}
        </Grid>
      </Container>
    </div>
  );
}

export default Home;
