import React, {useContext, useEffect} from 'react'
import { ApiContext } from "../context/ApiProvider";
import { CharactersCards } from "./CharacterCard";

const Result = () => {

    const {
        state: { characters }} = useContext(ApiContext);

    useEffect(() => {
        console.log("results ", characters)
    }, [characters]);

    return (
        <div className="container-fluid">
            <CharactersCards characters={characters}/>
        </div>
    )
};

export default Result