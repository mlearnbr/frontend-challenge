import { 
    useEffect, 
    useContext
} from 'react';
import MainCharacters from './components/MainCharacters';
import GlobalStateContext from '../../global/GlobalContext';
import { Header } from './style';

const CharactersPage = () => {

    const { states, requests } = useContext(GlobalStateContext)

    useEffect(() => {
        requests.getCharacters()
    }, [])

    return (
        <>
            <Header>
                <h1>Star Wars</h1>
            </Header>
            <MainCharacters characters={states.characters}/>
        </>
    );
}

export default CharactersPage;