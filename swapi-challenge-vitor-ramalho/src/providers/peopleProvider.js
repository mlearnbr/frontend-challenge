import axios from 'axios';
import React, {useState, useEffect} from 'react';

export const PeopleContext = React.createContext({});

export const PeopleProvider = (props) => {
    const [people, setPeople] = useState([
        {
            name: null,
            birth_year: null,
            eye_color: null,
            height: null,
            mass: null,
            skin_color: null,
            homeworld: null,
            films: null,
            species: null
        }

    ]);

    useEffect(() => { 
        axios
            .get('https://swapi.dev/api/people/?format=json')
            .then((response) => {
                setPeople(response.data.results);
            })
            .catch((err) => {
                console.log(err)
            })
    }, [])

    return(
        <PeopleContext.Provider value={{people, setPeople}}>
            {props.children}
        </PeopleContext.Provider>
    )
}

export const usePeople = () => React.useContext(PeopleContext);