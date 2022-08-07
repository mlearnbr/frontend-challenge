import React, { useState, useEffect } from "react";

import { CharacterOption } from "../../components/CharacterOption";
import { Loading } from "../../components/Loading";
import styles from "./CharacterList.module.css";

export default function CharacterList() {
  const [personas, setPersonas] = useState([]);
  const [personaInfo, setPersonaInfo] = useState({});
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(false);

  async function loadPersonas(page) {
    async function fetchPeople() {
      setLoading(true);
      let response = await fetch(`https://swapi.dev/api/people/?page=${page}`);
      let data = await response.json();
      console.log(data);
      setPage(page);
      setPersonaInfo(data);
      setPersonas(data.results);
      setLoading(false);
    }
    fetchPeople();
  }

  function prevPage() {
    loadPersonas(page - 1);
  }

  function nextPage() {
    loadPersonas(page + 1);
  }

  useEffect(() => {
    loadPersonas(1);
  }, []);

  return (
    <main className={styles.wrapper}>
      {loading ? (
        <Loading />
      ) : (
        <div>
          <div className={styles.items}>
            {personas.map((persona, index) => (
              <CharacterOption
                key={index}
                title={persona.name}
                creationDate={persona.created}
                skinColor={persona.skin_color}
                url={`/people/${persona.url.substring(29, 31)}`}
              />
            ))}
          </div>
          <div className={styles.actions}>
            <button disabled={personaInfo.previous === null} onClick={prevPage}>
              Anterior
            </button>
            <button disabled={personaInfo.next === null} onClick={nextPage}>
              Próximo
            </button>
          </div>
        </div>
      )}
    </main>
  );
}
