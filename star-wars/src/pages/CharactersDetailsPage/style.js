import styled from "styled-components";

export const Main = styled.main`
    display: flex;
    flex-direction: column;
    align-items: center;
`

export const Section = styled.section`
    display: flex;
    flex-direction: column;
    width: fit-content;
`

export const Header = styled.header`
    display: flex;
    justify-content: center;
`

export const Div = styled.div`
    border: 4px solid gray;
    margin: 4px;
    padding: 4px;
`

export const Button = styled.button`
    cursor: pointer;
    width: 100px;
    background-color: #020202;
    border: 2px solid #ffb703;
    color: lightgray;
    padding: 4px;
    
    &:hover {
        border: 2px solid #d00000;
        background-color: #6a040f;
        transition: 0.2s;
    }
`