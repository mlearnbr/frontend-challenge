import React, { useState } from 'react'
import { usePeople } from '../providers/peopleProvider';
//import axios from 'axios';
import '../App.css';
import './Characters.css';
import CharacterDetailsModal from './CharacterDetailsModal';

const Characters = () => {
    const { people } = usePeople();
    const [modalOpen, setModalOpen] = useState(false);
    const [index, setIndex] = useState();


    return (
        <>
            {modalOpen && <CharacterDetailsModal setOpenModal={setModalOpen} index={index} />}
            <h1 className="title">Star Wars Characters</h1>
            <div className="container">
                {people.map(characters =>
                    <div className="character-container">
                        <h2>{characters.name}</h2>
                        <p>{characters.birth_year}</p>
                        <button 
                            className="expand-info"
                            onClick={
                                //setando o indice de cada personagem e passando as infos para outro componente pelas props
                                () => {
                                    setModalOpen(true)
                                    let index = people.find((character) => {
                                        return character.name === characters.name
                                    })
                                    setIndex(index);
                                }
                            }
                        >
                            Expand Infos
                        </button>
                    </div>
                )}
            </div>
        </>
    )
}

export default Characters
