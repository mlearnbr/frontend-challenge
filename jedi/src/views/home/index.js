import React, { Component } from 'react';
import axios from 'axios';

import { Header, Main, Col } from '../../components/styled/content';
import { Logo } from '../../components/styled/text';

import Card from '../../components/functional/card';

class Home extends Component {
  constructor(props) {
    super(props);

    this.state = {
      people: [],
    };

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
          {people.map((item, index) => {
            return (
              <Col key={index}>
                <Card
                  link={`/people/${encodeURIComponent(item.url)}`}
                  // species={item.species}
                  name={item.name}
                  birth_year={item.birth_year}
                />
              </Col>
            );
          })}
        </Main>
      </div>
    );
  }
}

export default Home;
