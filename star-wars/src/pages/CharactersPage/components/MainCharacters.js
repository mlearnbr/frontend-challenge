import { useNavigate } from "react-router";

import { CardCharacter, MainStyle, Button } from "../style";

const MainCharacters = (props) => {
    
    const characters = props.characters

    let navigate = useNavigate()

    const goToDetails = (url) => {
        navigate(url)
    }
    
    const list = characters === undefined ? <p>Loading...</p> : characters.map((character, i) => {
        return (
            <CardCharacter key={character.url}>
                <h3>Nome: {character.name} </h3>
                <p>Aniversário: {character.birth_year}</p>
                <p>Genero: {character.gender}</p>
                <Button onClick={() => goToDetails(`/details/${i + 1}`)}>Conhecer {character.name}</Button>
            </CardCharacter>
        )
    })

    return (
        <MainStyle>
            {list}
        </MainStyle>
    );
}

export default MainCharacters;