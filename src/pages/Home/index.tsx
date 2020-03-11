import React, { useEffect, useState, useCallback } from 'react';

import CharacterCard from 'components/CharacterCard';
import CharactersSevice from 'services/characters.services';

import './home.css';

export default function HomePage() {
  const [page, setPage] = useState(1);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(false);
  const [characters, setCharacters] = useState([]);

  const fetchCharacters = useCallback(async () => {
    setIsLoading(true);
    try {
      const response = await CharactersSevice.getCharacters(page);
      const chars = response.data.results;
      setCharacters(prevChars => prevChars?.concat(chars));
    } catch {
      setError(true);
    } finally {
      setIsLoading(false);
    }
  }, [page]);

  useEffect(() => {
    fetchCharacters();
  }, [fetchCharacters]);

  return (
    <div id="home" className="page">
      <div className="container">
        {error && <p>Error loading characters. Please try refreshing the page</p>}

        {(!error && characters?.length > 0) && 
          <div id="catalogue">
            {characters.map((character: any) => (
              <CharacterCard key={character.name} character={character} />
            ))}
          </div>
        }

        {isLoading && <p id="loadingText">Loading characters...</p>}

        {(!isLoading && characters?.length > 0) && 
          <button id="btn-loadMore" onClick={() => setPage(page + 1)}>load more</button>
        }
      </div>
    </div>
  )
};
