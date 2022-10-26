import React from "react";
import {Switch, Route} from 'react-router-dom';
import CharacterDetail from "./pages/CharacterDetail";
import Home from "./pages/Home";
import './styles/reset.css';

export default function App() {
  return (
    <Switch>
      <Route path='/:id' component={CharacterDetail} />
      <Route path='/' component={Home} />
    </Switch>
  );
}
