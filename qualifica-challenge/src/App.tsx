import { Routes, Route } from 'react-router-dom';

import './App.css';

import Header from './components/Header';
import Character from './pages/Character';
import Profile from './pages/Profile/[cod]';

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Character />} />
        <Route path="/profile/:cod" element={<Profile />} />
      </Routes>
    </div>
  );
}

export default App;
