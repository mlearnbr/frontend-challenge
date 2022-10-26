/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getAllChars } from "../api";
import loading from '../assets/loading.gif';
import CharacterCard from "../components/CharacterCard";
import '../styles/Home.css';


export default function Home() {
  const [characters, setCharacters] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      setIsLoading(true);
      const response = await getAllChars();
      setCharacters(response);
      setIsLoading(false);
    }
    fetchData();
  }, []);

  return (
    <main className="page">
      <header>
        <h1 className="title">Star Wars Characters</h1>
      </header>
      <div className="container">
      {isLoading
        ? <img className="loading" src={loading} alt="loading"/>
        : <div className="card-list">
            {characters && characters
              .map((character, index) => (
                <Link key={character.name} to={`/${index < 16 ? index + 1 : index + 2}`}>
                  <CharacterCard character={character} index={index + 1} />
                </Link>
              ))
            }
          </div>}
      </div>
    </main>
  );
}
