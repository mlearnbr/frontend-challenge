import { gql } from "@apollo/client";

const CHARACTER = gql`
  query OneCharacter($id:ID!) {
    character(id:$id){
        id
        name
        birthYear
        eyeColor
        gender
        hairColor
        height
        mass
        skinColor
        homeworld{
          name
        }
        films{
          results{
            title
            releaseDate
          }
        }
        species{
          results{
            name
          }
        }
      
    }
  }
`;

export default CHARACTER;
