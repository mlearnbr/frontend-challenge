import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import Home from './views/home';
import People from './views/people';

export default function Routes() {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/People/:people" component={People} />
      </Switch>
    </BrowserRouter>
  );
}
