import styled from 'styled-components';

export const Container = styled.div`
  padding: 16px;
  margin-bottom: 24px;
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;

  @media only screen and (max-width: 767px) {
    flex-direction: column;
    align-items: center;
  }

  @media only screen and (min-width: 1024px) {
    flex-direction: row;
    justify-content: center;
    gap: 2rem;
  }
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

export const Input = styled.input`
  padding: 1rem;
  font-size: 14px;
  border: 2px solid #606060;
  border-radius: 0.25rem;
  background-color: #303030;
  color: #fafafa;
  margin-bottom: 1rem;

  @media only screen and (max-width: 767px) {
    width: 90%;
  }

  @media only screen and (min-width: 767px) and (max-width: 1023px) {
    width: 55%;
  }

  @media only screen and (min-width: 1024px) {
    width: 60%;
  }
`;
