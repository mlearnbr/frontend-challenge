import React, {useContext, useEffect} from 'react'
import { Link } from 'react-router-dom'
import { ApiContext } from "../context/ApiProvider";

const CharacterDetails = (props) => {

    const {
        action: { getCharacter, getHomeWorld },
        state: { selectedCharacter }} = useContext(ApiContext)

    useEffect(() => {
        getCharacter(props.location.query.url)
    }, [getCharacter, props.location.query.url]);

    return (
        <div className="container">
            <h1 className="text-white display-2" style={{marginTop: 100, marginBottom: 0}}>Character Details</h1>
            {(selectedCharacter !== {}) ? (
                    <div className="card text-center">
                        <div className="card-header">
                            <img src="https://www.logospng.com/images/213/im-225genes-de-personajes-star-wars-para-peques-213723.png" alt="Star Wars Logo" height="72" width="82"/>
                        </div>
                        <div className="card-body">
                            <h5 className="card-title h2">{selectedCharacter.name}</h5>
                            <p className="card-text">
                                <strong>Height:</strong> {selectedCharacter.height} {"//"} <strong>Mass:</strong> {selectedCharacter.mass}
                            </p>
                            <p className="card-text">
                                <strong>Hair Color:</strong> {selectedCharacter.hair_color} {"//"} <strong> Skin Color:</strong> {selectedCharacter.skin_color} {"//"} <strong> Eye Color:</strong> {selectedCharacter.eye_color}
                            </p>
                            <p className="card-text">
                                <strong> Birth Year:</strong> {selectedCharacter.birth_year}
                            </p>
                            <p className="card-text">
                                <strong> Gender:</strong> {selectedCharacter.gender}
                            </p>
                            <p className="card-text">
                                <strong> Homeworld:</strong> {getHomeWorld(selectedCharacter.homeworld)}
                            </p>

                        </div>

                        <Link
                            to="/"
                            className="btn btn-warning"
                        >Voltar</Link>
                    </div>
                )

                : ""}
        </div>
    )
}

export default CharacterDetails
