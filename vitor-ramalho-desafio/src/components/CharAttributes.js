import React from 'react';
import { Modal } from 'semantic-ui-react'


class CharAttributes extends React.Component {
    render() {
        return (
            <>
                <Modal.Header><h1>Character Info</h1> </Modal.Header>
                <Modal.Content>
                    <strong>Name</strong>
                    <p>{this.props.char.name}</p>
                    <strong>Birth Year</strong>
                    <p>{this.props.char.birth_year}</p>
                    <strong>Eye Color</strong>
                    <p>{this.props.char.eye_color}</p>
                    <strong>Height</strong>
                    <p>{this.props.char.height}</p>
                    <strong>Mass</strong>
                    <p>{this.props.char.mass}</p>
                    <strong>Skin Color</strong>
                    <p>{this.props.char.skin_color}</p>
                    <strong>HomeWorld</strong>
                    <p>{this.props.char.homeworld}</p>
                    <strong>Films</strong>
                    <p>{this.props.char.films}</p>
                    <strong>Species</strong>
                    <p>{this.props.char.species}</p>
                </Modal.Content>
            </>
        );
    }
}


export default CharAttributes;


