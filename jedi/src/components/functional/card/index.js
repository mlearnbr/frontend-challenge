import React from 'react';
import { Link } from 'react-router-dom';

import { Card, CardHeader, CardBody, CardContent } from '../../styled/content';
import { Text, Label } from '../../styled/text';

const card = props => (
  <Card>
    <Link to={props.link}>
      <CardHeader>
        <Text color="#fff">{props.name}</Text>
      </CardHeader>

      <CardBody>
        <CardContent>
          <Label color="#ffc">Nascimento</Label>
          <Text color="#fff">{props.birth_year}</Text>
        </CardContent>

        {/* <CardContent>
          <Label>Especie</Label>
          <Text>{props.specie}</Text>
        </CardContent> */}
      </CardBody>
    </Link>
  </Card>
);

export default card;
