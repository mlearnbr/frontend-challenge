
export const filmsListQueryDef = () => `
query {
  films {
  	results {
      id
      title
    }
  }
}
`