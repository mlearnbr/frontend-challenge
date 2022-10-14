/* eslint-disable comma-dangle */
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import {
  BrowserRouter, Routes, Route,
} from 'react-router-dom';
import Home from './pages/Home';
import Details from './pages/Details';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <BrowserRouter>
    <Routes>
      <Route element={<App />}>
        <Route path="/" element={<Home />} />
        <Route path="/users/:characterId" element={<Details />} />
      </Route>
    </Routes>
  </BrowserRouter>
);
