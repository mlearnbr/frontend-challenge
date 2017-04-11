import React, {Component} from 'react';
import axios from 'axios';
import {goToDetails} from '../../helpers/go-to';

class ContentItem extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name: '',
            species: 'Default'
        }
    }

    componentWillMount() {
        this.setState({
            name: this.props.data.name,
            birth_year: this.props.data.birth_year,
            species: this.getSpecies(this.props.data.species[0])
        })
    }

    getSpecies(endpoint) {
        const context = this;
        axios.get(endpoint)
            .then(function (response) {
                context.setState({
                    species: response.data.name
                })
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    render() {
        return (<div onClick={goToDetails.bind(this, this.props.data)} className="col s12 l4 content-item">
            <div className="item-box">
                <h3>{this.state.name}</h3>
                <p>{this.state.species}</p>
                <p>{this.state.birth_year}</p>
            </div>
        </div>)
    }
}

ContentItem.contextTypes = {
    router: React.PropTypes.object.isRequired,
};

export default ContentItem;