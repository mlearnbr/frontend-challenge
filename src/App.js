import React, { useContext } from 'react';
import './App.css';

import {ApiContext} from "./context/ApiProvider";

import Result from './components/Result';
import Header from './components/Header';
import Search from './components/Search';

const App = () => {
  const {
    state: { characters }} = useContext(ApiContext)

  return (
      <div className="App">
        <Header />
        <Search />
        { (characters.length) ? <Result/> : "" }
      </div>
  )
}

export default App