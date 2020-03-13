import React, { useEffect } from 'react'
import { Link } from 'react-router-dom'
import {makeStyles} from '@material-ui/core/styles';

export const CharactersCards = (props) => {

    const useStyles = makeStyles(theme => ({
        root: {
            minWidth: 420,
            minheight:640,
            marginRight: 'auto',
            marginLeft:'auto',
            marginBottom:'30px',
            marginTop:'30px',
            backgroundColor:"#323232"
        },
        media: {
            height: 0,
            width:280,
            marginLeft:'auto',
            marginRight: 'auto',
            marginTop:'auto',
            paddingTop: '99.25%',
            paddingBottom: '30%',
        },
        title:{
            marginLeft:'auto',
            marginRight: 'auto',
        },
        alive: {
            backgroundColor: "#038c1a"
        },
        presumed: {
            backgroundColor: "#ff1100",
        },
        dead:{
            backgroundColor :"#fc8c03"
        },
        unknown:{
            backgroundColor: "#4f4f4f"
        }

    }));

    const { characters } = props;

    useEffect(() => {
        console.log("props", characters)
    }, [characters]);

    return (
        <div className="row">
            {characters.map( character => {
                return(
                    <div className="col-lg-4 col-md-6" key={character.url}>
                        <div className="card">
                            <div className="card-header">
                            </div>
                            <div className="card-body">
                                <h5 className="card-title h2">{character.name}</h5>
                                <p className="card-text">
                                    <strong>Height:</strong> {character.height} {"//"} <strong>Mass:</strong> {character.mass}
                                </p>
                                <p className="card-text">
                                    <strong>Hair Color:</strong> {character.hair_color} {"//"} <strong> Skin Color:</strong> {character.skin_color} {"//"} <strong> Eye Color:</strong> {character.eye_color}
                                </p>
                                <p className="card-text">
                                    <strong> Birth Year:</strong> {character.birth_year}
                                </p>
                                <p className="card-text">
                                    <strong> Gender:</strong> {character.gender}
                                </p>

                                <Link
                                    to={
                                        { pathname: `/characterdetails/${character.name}`,
                                            query:{url: character.url}
                                        }}
                                    className="btn btn-warning"

                                >Detalhes</Link>
                            </div>
                        </div>
                    </div>

                )
            })}
        </div>
    )
};
