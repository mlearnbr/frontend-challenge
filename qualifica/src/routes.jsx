import React from "react";

import { BrowserRouter, Switch, Route } from "react-router-dom";

import CharacterList from "./pages/CharacterList";
import CharacterSpecification from "./pages/CharacterSpecification";

const Routes = () => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" component={CharacterList} />
      <Route path="/people/:id" component={CharacterSpecification} />
    </Switch>
  </BrowserRouter>
);

export default Routes;
