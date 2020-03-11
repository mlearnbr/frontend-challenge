import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect
} from 'react-router-dom';

import TopBar from 'components/TopBar';
import HomePage from 'pages/Home';

export default function AppRouter() {
  return (
    <Router>
      <TopBar />

      <Switch>
        <Route path="/" component={HomePage} />
        <Redirect from="*" to="/" />
      </Switch>
    </Router>
  )
};
