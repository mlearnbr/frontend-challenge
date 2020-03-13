import React, { Component } from 'react';
import 'whatwg-fetch';

export const ApiContext = React.createContext({});

export default  class ApiProvider extends  Component {
    constructor(props) {
        super(props)
        this.state = {
            characters:[],
            homeworld: {},
            selectedCharacter: {}
        }
    }

    selectedCharacter = (character) =>{
        this.setState({
            selectCharacter: character
        })
    }

    getSearch = (name) => {
        if(name !== ""){
            fetch(`https://swapi.co/api/people/?search=${name}`)
                .then(response => response.json())
                .then(json => this.setState({ characters: json.results }, ( ) => {
                    console.log("Result: ", this.state.characters)
                }))
        }
    }

    getCharacter = (url) => {
        fetch(url)
            .then(response => response.json())
            .then(json => this.setState({ selectedCharacter: json }, ( ) => {
                console.log("character: ", this.state.selectedCharacter)
            }))
    }

    getHomeWorld = (url) => {
        fetch(url)
            .then( response => response.json() )
            .then( json => this.setState({ homeworld: json } ))
        return this.state.homeworld.name
    }

    render(){
        const value = {
            state: { ...this.state },
            action: {
                getSearch: this.getSearch,
                getHomeWorld: this.getHomeWorld,
                selectCharacter: this.selectCharacter,
                getCharacter: this.getCharacter
            }
        };

        return (
            <ApiContext.Provider value={value}>
                {this.props.children}
            </ApiContext.Provider>
        )
    }

}