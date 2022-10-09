import styled from 'styled-components';

export const Container = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: space-between;

  height: 200px;

  background-color: #303030;

  border-width: 2px;
  border-style: solid;
  border-color: #606060;
  border-radius: 0.5rem;

  padding: 16px;

  @media only screen and (max-width: 767px) {
    width: 91.66%;
  }

  @media only screen and (min-width: 767px) and (max-width: 1023px) {
    width: 33.33%;
  }

  @media only screen and (min-width: 1024px) {
    width: 25%;
  }
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 0.25rem;
`;

export const Name = styled.p`
  font-size: 1.5rem;
  text-transform: uppercase;
  color: #ffe81f;
  margin-bottom: 0.5rem;
`;

export const Specie = styled.span``;

export const BrithYear = styled.span``;

export const Button = styled.button`
  font-size: 1rem;
  text-transform: uppercase;
  padding: 0.5rem 1rem;
  border: 2px solid #ffe81f;
  background: transparent;
  color: #ffe81f;
  width: 100%;
  cursor: pointer;
`;
