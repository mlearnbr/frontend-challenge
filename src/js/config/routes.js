import React from 'react'
import { Router, Route, hashHistory, IndexRoute  } from 'react-router'
/**
 * Helpers
 */

import ThemedApp from '../App';

/**
 * Pages
 */
import Home from '../pages/home';
import Details from '../pages/details';

function Routes () {
    return (
        <Router history={hashHistory}>
            <Route path='/' component={ThemedApp}>
                <IndexRoute component={Home}/>
                <Route path='home' component={Home}/>
                <Route path='details' component={Details}/>
            </Route>
        </Router>
    );
};

export default Routes;