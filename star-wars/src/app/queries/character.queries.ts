

export const charactersListQueryDef = () => `
  query {
    characters {
      results {  
        id
        name
        birthYear
        species {
          results { id name }
        }
      }
    }
  }
`

export const characterObjQueryDef = (id) => `
  query {
    character(id:"${id}") {
      id
      name

      birthYear
      eyeColor
      gender
      hairColor
      height
      mass
      skinColor
      homeworld { id name } 
      films {
        results { id title releaseDate }
      }
      species {
        results { id name }
      }
    }
  }
`