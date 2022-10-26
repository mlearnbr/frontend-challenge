import React from "react";
import '../styles/CharacterCard.css';

export default function CharacterCard({character, index}) {

  const getCharacterImage = (i) => {
        return i < 17
          ? `https://starwars-visualguide.com/assets/img/characters/${i}.jpg`
          : `https://starwars-visualguide.com/assets/img/characters/${i+1}.jpg`;
  }

  return (
    <div className="card">
      <img src={getCharacterImage(index)} alt={character.name} />
      <div className="intro">
        <h2>{character.name}</h2>
        <p>Species: <span>{character.species}</span></p>
        <p>Birth Year: <span>{character.birth_year}</span></p>
      </div>
    </div>
  )
}
