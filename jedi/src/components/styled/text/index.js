import styled from 'styled-components';

export const Logo = styled.a`
  position: relative;
  width: 192px;
  height: 60px;
  background-repeat: no-repeat;
  background-position: center;
  background-image: url('https://static-mh.content.disney.io/starwars/assets/navigation/sw_logo_horiz@2x-f98247cb30aa.png');
  background-size: 100%;
`;

export const Label = styled.label`
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
  color: ${props => props.color};
`;

export const Text = styled.h4`
  margin-top: 10px;
  font-size: 22px;
  font-weight: bold;
  color: ${props => props.color};
`;

export const TextBlack = styled.h2`
  font-size: 32px;
  font-weight: bold;
  color: #000;
`;
