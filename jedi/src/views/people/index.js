import React, { Component } from 'react';
import axios from 'axios';

import {
  Header,
  Main,
  Container,
  Content,
  CardHeader,
  CardBody,
  Center,
} from '../../components/styled/content';

import { Logo, TextBlack, Label, Text } from '../../components/styled/text';

class People extends Component {
  constructor({ match }) {
    super({ match });

    this.state = {
      data: [],
      loading: true,
    };

    this.load(decodeURIComponent(match.params.people));
  }

  load = async url => {
    const resp = await axios.get(url);

    this.setState({ ...this.setState, data: resp.data });
  };

  render() {
    const { data } = this.state;

    return (
      <div>
        <Header>
          <Logo />
        </Header>

        <Main>
          <Container>
            <Content>
              <CardHeader>
                <TextBlack>{data.name}</TextBlack>
              </CardHeader>
              <CardBody>
                <Center>
                  <Label color="#1C1C1C">Gênero</Label>
                  <Text color="#000">{data.gender}</Text>
                </Center>

                <Center>
                  <Label color="#1C1C1C">Altura</Label>
                  <Text color="#000">{data.height}</Text>
                </Center>

                <Center>
                  <Label color="#1C1C1C">Massa</Label>
                  <Text color="#000">{data.mass}</Text>
                </Center>

                <Center>
                  <Label color="#1C1C1C">Cor do cabelo</Label>
                  <Text color="#000">{data.hair_color}</Text>
                </Center>

                <Center>
                  <Label color="#1C1C1C">Cor dos Olhos</Label>
                  <Text color="#000">{data.eye_color}</Text>
                </Center>

                <Center>
                  <Label color="#1C1C1C">Cor da pele</Label>
                  <Text color="#000">{data.skin_color}</Text>
                </Center>
              </CardBody>
            </Content>
          </Container>
        </Main>
      </div>
    );
  }
}

export default People;
