

export const charactersListQueryDef = () => `
  query {
    characters(order: name_ASC) {
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

export const charactersListByFilmQueryDef = (id) => `
  query {
    film(id: "${id}") {
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