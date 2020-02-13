import styled from 'styled-components';

export const Header = styled.header`
  width: 100%;
  position: fixed;
  top: 0;
  display: flex;
  justify-content: center;
  background-color: #000000;
`;

export const Main = styled.div`
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  height: calc(100vh - 80px);
  padding: 70px 0px 10px;
  background-color: #ccc;
`;

export const Card = styled.div`
  height: auto;
  padding: 10px;
  border-radius: 10px;
  margin-bottom: 10px;
  background-color: #000;
`;

export const CardHeader = styled.div`
  text-align: center;
  margin-bottom: 10px;
`;

export const CardBody = styled.div`
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  /* justify-content: space-between; */
`;

export const CardContent = styled.div`
  justify-items: center;
  align-items: center;
  padding: 5px;
`;

export const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
`;

export const Content = styled.div`
  min-width: 90%;
  padding: 10px;
  border-radius: 15px;
  background-color: #fff;

  @media (min-width: 768px) {
    min-width: 360px;
  }
`;

export const Center = styled.div`
  width: 100%;
  text-align: center;
  padding: 8px;
  margin-bottom: 5px;
  border-radius: 5px;
  border: solid 2px #ccc;
`;

export const Col = styled.div`
  min-width: calc(100% - 16px);
  padding: 8px;

  @media (min-width: 768px) {
    min-width: calc(50% - 16px);
  }

  @media (min-width: 1023px) {
    min-width: calc(33% - 16px);
  }

  @media (min-width: 1235px) {
    min-width: calc(25% - 16px);
  }
`;
