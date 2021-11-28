import { useContext, useEffect } from "react";
import { useParams } from 'react-router-dom';
import { useNavigate } from "react-router";
import GlobalStateContext from "../../global/GlobalContext";

import { Section, Main, Div, Header, Button } from './style'

function CharactersDetailsPage() {

    const param = useParams()
    const { states, requests } = useContext(GlobalStateContext)

    let navigate = useNavigate()

    const goBack = (url) => {
        navigate(-1)
    }
    
    useEffect(() => {
        requests.getCharacter(param.index)
    }, [])

    const details = states.character === undefined ? 
    <p>Loading...</p>
    : 
    <Section>
        <Div>
            <p>Espécie: {states.species}</p>
            <p>Gênero: {states.character.gender}</p>
            <p>Aniversário: {states.character.birth_year}</p>
            {states.planet === undefined ? <p>Loading...</p> : <p> Planeta: {states.planet} </p>}
            <p>Cor dos olhos: {states.character.eye_color}</p>
            <p>Cor dos cabelos: {states.character.hair_color}</p>
            <p>Altura: {states.character.height}cm</p>
            <p>Peso: {states.character.mass}</p>
            <p>Cor da pele: {states.character.skin_color}</p>
        </Div>
        <Div>
            <h2>Filmes</h2>
            {states.films.map((film,i) => {
                return (
                    <p key={i}> {film.title} </p>
                )
            })}
        </Div>
    </Section>

    return (
        <>
            <Header>
                <Button onClick={goBack}> Voltar </Button>
            </Header>
            <Main>
                <h1>{states.character === undefined ? <p>Loading...</p> : states.character.name}</h1>
                {details}
            </Main>
        </>
    );
}

export default CharactersDetailsPage;