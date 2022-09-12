import styled, { createGlobalStyle } from "styled-components"

const theme = {
  colors: {
    main: '#EEDB00',
    secondary: '#000000'
  }
}


export const GlobalStyle = createGlobalStyle<{ theme: typeof theme }>`
 
  * {
    background-color: ${props => props.theme.colors.secondary};
    box-sizing: border-box;
    color: ${props => props.theme.colors.main};
    font-family: sans-serif;
    margin: 0;
    padding: 0;
  }

  img {
    object-fit: cover;
    width: 100%;
  }

  ul {
    list-style: none;
  }
`

export const Main = styled.main`
  align-items: center;
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: space-around;
  padding: 1rem;

  a {
    color: ${props => props.theme.colors.main};
    text-decoration: none;
  }

  ul {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1rem;
    place-content: center;
    width: 100%;
  }
`

export const PrimaryButton = styled.button`
  background-color: ${props => props.theme.colors.secondary};
  border-radius: 15px;
  border: 2px solid ${props => props.theme.colors.main};
  color: ${props => props.theme.colors.main};
  font-size: 1em;
  margin: 1em;
  min-width: 100px;
  padding: 0.25em 1em;
`;

export default theme