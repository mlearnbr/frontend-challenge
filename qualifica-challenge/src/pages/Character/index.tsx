import { useEffect } from 'react';
import Card from '../../components/Card';
import { usePeople } from '../../hooks/people';

import { Container } from './styles';

function Character() {
  const { characters, handleCharacters } = usePeople();

  useEffect(() => {
    handleCharacters();
  }, []);

  return (
    <Container>
      {characters.map((character, index) => (
        <Card
          key={index}
          name={character.name}
          specie={character?.species[0]}
          brithYear={character.birth_year}
        />
      ))}
    </Container>
  );
}
export default Character;
