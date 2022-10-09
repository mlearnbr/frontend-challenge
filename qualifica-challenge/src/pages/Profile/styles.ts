import styled from 'styled-components';

export const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 1rem;
`;

export const Name = styled.h1``;

export const Content = styled.div`
  background-color: #303030;
  border: 2px solid #606060;
  border-radius: 0.5rem;
  width: 90%;
  padding: 1rem;
  margin-top: 1rem;
`;

export const Section = styled.div`
  margin-bottom: 1rem;
`;

export const Info = styled.p`
  font-size: 1rem;
  text-transform: uppercase;
  margin: 0.25rem 0;
  padding: 0;
`;

export const Logo = styled.img`
  @media only screen and (max-width: 767px) {
    width: 150px;
  }

  @media only screen and (min-width: 767px) and (max-width: 1023px) {
    width: 200px;
  }

  @media only screen and (min-width: 1024px) {
    width: 200px;
  }
`;
