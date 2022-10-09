import logoImg from '../../assets/star-wars-4.svg';
import { usePeople } from '../../hooks/people';

import { Container, Content, Input, Logo } from './styles';

function Header() {
  const { search, handleSearch } = usePeople();

  return (
    <Container>
      <Content>
        <Logo src={logoImg} />
        <Input
          type="text"
          value={search}
          onChange={(e) => handleSearch(e.target.value)}
          placeholder="Buscar..."
        />
      </Content>
    </Container>
  );
}
export default Header;
