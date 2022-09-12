import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom"
import CharacterPage from './components/CharacterPage'
import CharacterProvider from './contexts/CharacterContex'
import { ThemeProvider } from 'styled-components'
import theme, { GlobalStyle } from './theme'

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <ThemeProvider theme={theme}>
      <GlobalStyle />
      <CharacterProvider>
          <BrowserRouter>
            <Routes>
              <Route path='/' element={<App />} />
              <Route path='/person' element={<CharacterPage />} />
            </Routes>
          </BrowserRouter>
      </CharacterProvider>
    </ThemeProvider>
  </React.StrictMode>
)
