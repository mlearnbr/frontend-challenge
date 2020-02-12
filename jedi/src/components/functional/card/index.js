import React from 'react';

import { Card } from '../../styled/content';
import { Label, Text } from '../../styled/text';

const card = props => (
  <Card>
    <Label>Especie: </Label>
    <Text>{props.species}</Text>
    <Label>Nome: </Label>
    <Text>{props.name}</Text>
    <Label>Nascimento: </Label>
    <Text>{props.birth_year}</Text>
  </Card>
);

export default card;
