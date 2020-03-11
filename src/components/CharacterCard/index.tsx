import React from 'react';
import { Link } from 'react-router-dom';

import './character-card.css';

interface CharacterCardProps {
  character: any
};

export default function CharacterCard(props: CharacterCardProps) {
  const { character } = props;

  const getCharacterId = (url: string) => {
    return url.split('/').slice(-2)[0];
  }

  return (
    <div className="characterCard">
      <figure className="characterCard__photo">
        <img src="" alt="" />
      </figure>

      <div className="characterCard__infos">
        <h2>{ character.name }</h2>
        <p>Birth year: { character.birth_year }</p>
      </div>

      <Link className="characterCard__btn" to={`/character/${getCharacterId(character.url)}`}>
        See more
      </Link>
    </div>
  )
}
