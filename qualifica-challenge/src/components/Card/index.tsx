import { BrithYear, Button, Container, Content, Name, Specie } from './styles';

interface CardProsp {
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
      <Button>ver detalher</Button>
    </Container>
  );
}
export default Card;
