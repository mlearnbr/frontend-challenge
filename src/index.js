import React from 'react';
import ReactDOM from 'react-dom';
import Routes from './js/config/routes';
import { Provider } from 'react-redux';
import Store from './js/store';
import * as firebase from 'firebase';

import './sass/index.scss';

const StoreInstance = Store();

ReactDOM.render(
    <Provider store={StoreInstance}>
        <Routes/>
    </Provider>,
    document.getElementById('root')
);
