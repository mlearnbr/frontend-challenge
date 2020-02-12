import React, { Component } from 'react';
import axios from 'axios';

import { Header, Main } from './components/styled/content';
import { Logo } from './components/styled/text';

import Card from './components/functional/card';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      people: [],
    };
  }

  UNSAFE_componentWillMount() {
    this.load();
  }

  load = async () => {
    const resp = await axios.get('https://swapi.co/api/people/');

    this.setState({ ...this.state, people: resp.data.results });
  };

  render() {
    const { people } = this.state;

    return (
      <div className="App">
        <Header>
          <Logo />
        </Header>
        <Main>
          {people.map(item => {
            return (
              <Card
                species={item.species}
                name={item.name}
                birth_yaer={item.birth_yaer}
              />
            );
          })}
        </Main>
      </div>
    );
  }
}

export default App;
