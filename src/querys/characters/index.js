import { gql } from "@apollo/client";

const CHARACTERS = gql`
  query AllCaracters {
    characters {
      results {
        id
        name
        species{
          results{
            name
          }
        }
        birthYear
      }
    }
  }
`;

export default CHARACTERS;
