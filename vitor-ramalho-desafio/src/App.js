import React, { useState, useEffect } from 'react';
import { Container, Dimmer, Loader } from 'semantic-ui-react'
import Char from './components/Chars'
import './App.css'

function App() {
  const [char, setChar] = useState([]);
  const [planets, setPlanets] = useState([]);
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchChar() {
      let res = await fetch('https://swapi.co/api/people/?format=json');
      let data = await res.json();
      setChar(data.results);
    }

    async function fetchPlanets() {
      let res = await fetch('https://swapi.co/api/planets/?format=json');
      let data = await res.json();
      setPlanets(data.results);
    }

    fetchChar();
    fetchPlanets();
    setLoading(false)
  }, [])

  return (
    <>
      <Container>
        {loading ? (
          <Dimmer active inverted>
            <Loader inverted> Loading ...</Loader>
          </Dimmer>
        ) : (
            <Char data={char} />
          )}

      </Container>
    </>
  );
}

export default App;
