import { createGlobalStyle } from 'styled-components'

const Reset = createGlobalStyle`
    * {
        padding: 0;
        margin: 0;
        font-family: 'Ubuntu', sans-serif;
    }

    body {
        background-color: #020202;
    }

    section {
        background-color: black;
    }

    h1, h2, h3, h4, h5, h6 {
        color: lightgray;
    }

    p {
        font-size: 1rem;
        color: #adb5bd;
    }
`

export default Reset;