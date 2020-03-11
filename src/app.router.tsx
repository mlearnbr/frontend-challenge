import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect
} from 'react-router-dom';

import TopBar from 'components/TopBar';
import CharacterPage from 'pages/Character';
import HomePage from 'pages/Home';

export default function AppRouter() {
  return (
    <Router>
      <TopBar />

      <Switch>
        <Route exact path="/" component={HomePage} />
        <Route path="/character/:id" component={CharacterPage} />
        <Redirect from="*" to="/" />
      </Switch>
    </Router>
  )
};
