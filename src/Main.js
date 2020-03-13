import React, { Component } from 'react'
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import App from './App';

const Main = props => (
    <Switch>
        <Route exact path="/" omponent={App} />
    </Switch>
);

export default Main