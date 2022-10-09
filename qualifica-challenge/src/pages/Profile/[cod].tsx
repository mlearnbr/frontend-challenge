import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

import Api from '../../service';
import { IFilm, IPeople } from '../../types';

import logoImg from '../../assets/star-wars-4.svg';

import { Container, Content, Logo, Section } from './styles';

function Profile() {
  const { cod } = useParams();
  const [dataPeople, setDataPeople] = useState<IPeople>();
  const [listFilms, setListFilms] = useState<IFilm[]>([]);

  const handlerFilms = async (films: string[]) => {
    const res = films.map(async (film) => {
      const { data } = await Api.get(film);
      return data;
    });

    const result = await Promise.all(res);
    setListFilms(result);
  };

  const handlerPeoples = async () => {
    const { data } = await Api.get(`/people/${cod}`);

    setDataPeople(data);

    handlerFilms(data.films);
  };

  useEffect(() => {
    handlerPeoples();
  }, []);

  return (
    <Container>
      <Logo src={logoImg} />
      <Content>
        <h1>{dataPeople?.name}</h1>

        <Section>
          <p>Species:</p>
          <p>Birth Year: {dataPeople?.birth_year}</p>
          <p>Eye Color: {dataPeople?.eye_color}</p>
          <p>Gender: {dataPeople?.gender}</p>
          <p>Hair Color: {dataPeople?.hair_color}</p>
          <p>Height: {dataPeople?.height}</p>
          <p>Mass: {dataPeople?.mass}</p>
          <p>Skin Color: {dataPeople?.skin_color}</p>
        </Section>
        <Section>
          <p>Films:</p>
          <ul>
            {listFilms.map((film, index) => (
              <li key={index}>{film.title}</li>
            ))}
          </ul>
        </Section>
      </Content>
    </Container>
  );
}
export default Profile;
