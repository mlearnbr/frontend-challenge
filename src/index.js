import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import ApiProvider from "./context/ApiProvider";

import CharacterDetails from './components/CharacterDetails';

ReactDOM.render(
    <BrowserRouter>
        <Switch>
            <ApiProvider>
                <Route path="/" exact={true} component={App} />
                <Route path="/characterdetails/:name" component={CharacterDetails} />
            </ApiProvider>
        </Switch>
    </BrowserRouter>
    , document.getElementById('root'));
