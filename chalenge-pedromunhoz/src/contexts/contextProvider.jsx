import React , { createContext, useContext, useState } from 'react'

const StateContext = createContext();

export const ContextProvider = ({children}) =>{
    const [peoples, setPeoples] = useState([])

    // modal value
    const [openCharacterDetails, setOpenCharacterDetails] = useState(false)
    const [openFilmsCharacters, setOpenFilmsCharacter] = useState(false)

    // character infos
    const [name, setName] = useState([])
    const [birth_year, setBirth_year] = useState('')
    const [eye_color, setEye_color] = useState('')
    const [gender, setGender] = useState('')
    const [hair_color, setHair_color] = useState('')
    const [height, setHeight] = useState('')
    const [mass, setMass] = useState('')
    const [skin_color, setSkin_color] = useState('')
    const [homeworld, setHomeworld] = useState('')
    const [films, setFilms] = useState([])
    const [specie, setSpecie] = useState([])

    // api links
    const [filmsLink, setFilmsLink] = useState()
    const [charactersLink, setCharactersLink] = useState([])

    return (
        <StateContext.Provider
            value={{
                peoples,setPeoples,
                specie,setSpecie,
                openCharacterDetails,setOpenCharacterDetails,
                openFilmsCharacters,setOpenFilmsCharacter,
                name, setName,
                birth_year, setBirth_year,
                eye_color, setEye_color,
                gender, setGender,
                hair_color, setHair_color,
                height, setHeight,
                mass, setMass,
                skin_color, setSkin_color,
                homeworld, setHomeworld,
                films, setFilms,
                filmsLink, setFilmsLink,
                charactersLink, setCharactersLink
            }}
        >
                {children}
        </StateContext.Provider>
    )
}

export const UseStateContext = ()=> useContext(StateContext)