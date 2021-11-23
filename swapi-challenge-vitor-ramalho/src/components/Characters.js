import React, { useState } from 'react'
import { usePeople } from '../providers/peopleProvider';
//import axios from 'axios';
import '../App.css';
import './Characters.css';
import CharacterDetailsModal from './CharacterDetailsModal';

const Characters = () => {
    const { people } = usePeople();
    //const [people, setPeople] = useState([{}]);
    const [modalOpen, setModalOpen] = useState(false);
    //const [characterInfo, setCharacterInfo] = useState(false);

    console.log('this is the return of characters', '-----', people);

    const showCharacterInfo = () => {
        //setCharacterInfo = true;
    }

    /*useEffect(() => {
        axios
            .get('https://swapi.dev/api/people/?format=json')
            .then((response) => {
                setPeople(response.data.results);
            })
            .catch((err) => {
                console.log(err)
            })
    }, [])*/


    return (
        <>
            {modalOpen && <CharacterDetailsModal setOpenModal={setModalOpen} />}
            <h1 className="title">Star Wars Characters</h1>
            <div className="container">
                {people.map(characters =>
                    <div className="character-container">
                        <h2>{characters.name}</h2>
                        <p>{characters.birth_year}</p>
                        <button onClick={() => { setModalOpen(true); }}>Expand Infos</button>
                    </div>
                )}
            </div>
        </>
    )
}

export default Characters
