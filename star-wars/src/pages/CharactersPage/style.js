import styled from 'styled-components'

export const CardCharacter = styled.section`
    display: flex;
    flex-direction: column;
    
    align-items: center;

    height: 18vh;
    width: 90%;

    margin: 4px;
    border: 4px solid gray;
    padding: 4px;

    @media(max-width: 426px) {
        min-width: 80vh;
    }
`

export const MainStyle = styled.main`
    display: flex;
    justify-content: center;
    flex-wrap: wrap;

    max-width: 100%;
    min-width: 100%;

    align-items: center;

    @media(max-width: 425px) {
        display: flex;
        flex-direction: column;
    }

    @media(min-width: 530px) {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }

    @media(min-width: 768px) {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
    }
`

export const Button = styled.button`
    background-color: #020202;
    color: white;
    
    cursor: pointer;
    
    flex-grow: 1;
    width: 80%;
    height: 20%;
    border: 2px solid #ffb703;
    padding: 2px;
    margin: 4px;

    &:hover {
        border: 2px solid #d00000;
        background-color: #370617;
        transition: 0.2s;
    }
`

export const Header = styled.header`
    display: flex;
    justify-content: center;

    margin: 8px;
`