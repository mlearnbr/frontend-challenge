import { Link } from 'react-router-dom';

import { BrithYear, Button, Container, Content, Name, Specie } from './styles';

interface CardProsp {
  id: number;
  name: string;
  specie: string;
  brithYear: string;
}

function Card(props: CardProsp) {
  return (
    <Container>
      <Content>
        <Name>{props.name}</Name>
        <Specie>
          <b>Specie:</b> {props.specie}
        </Specie>
        <BrithYear>
          <b>Birth Year:</b> {props.brithYear}
        </BrithYear>
      </Content>
      <Link to={`/profile/${props.id}`}>
        <Button>ver detalher</Button>
      </Link>
    </Container>
  );
}
export default Card;
