import placeholder from "../../assets/placeholder.png"

function CharacterPage() {

  return (
    <>
      <section>
        <button onClick={() => history.back()}>
          Back to the list
        </button>
      </section>
      <section>
        <figure>
          <img src={placeholder} alt="Character Thumbnail" height={150} width={200}/>
        </figure>
        <details>
          <p>name</p>
          <p>birth_year</p>
          <p>eye_color</p>
          <p>gender</p>
          <p>hair_color</p>
          <p>height</p>
          <p>mass</p>
          <p>skin_color</p>
          <p>homeworld</p>
          <p>filmes</p>
          <p>species</p>
        </details>
      </section>
    </>
  )
}

export default CharacterPage