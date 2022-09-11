import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom"
import CharacterPage from './components/CharacterPage'

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<App />} />
        <Route path='/person' element={<CharacterPage />} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
)
