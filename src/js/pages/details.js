import React, {Component} from 'react';
import Header from '../components/components/header';
class Details extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name: '',
            birth_year: '',
            eye_color: '',
            gender: '',
            hair_color: '',
            height: '',
            mass: '',
            skin_color: '',
            homeworld: '',
            films: '',
            species: ''
        }
    }

    componentWillMount() {
        const context = this.props.location.query;
        this.setState({
            name: context.name,
            birth_year: context.birth_year,
            eye_color: context.eye_color,
            gender: context.gender,
            hair_color: context.hair_color,
            height: context.height,
            mass: context.mass,
            skin_color: context.skin_color,
            homeworld: context.homeworld,
            films: context.films,
            species: context.species
        })
    }

    render() {
        return (
            <div id="p-details">
                <Header />
                <div className="container">
                    <div className="row">
                        <div id="detail-box" className="col s12">
                            <h2>{this.state.name}</h2>
                            <div className="col s12 m6"><strong>Birth Year: </strong>{this.state.birth_year}</div>
                            <div className="col s12 m6"><strong>Eye Color: </strong>{this.state.eye_color}</div>
                            <div className="col s12 m6"><strong>Gender: </strong>{this.state.gender}</div>
                            <div className="col s12 m6"><strong>Hair Color: </strong>{this.state.hair_color}</div>
                            <div className="col s12 m6"><strong>Height: </strong>{this.state.height}</div>
                            <div className="col s12 m6"><strong>Mass: </strong>{this.state.mass}</div>
                            <div className="col s12 m6"><strong>Skin Color: </strong>{this.state.skin_color}</div>
                            <div className="col s12 m6"><strong>Home World: </strong>{this.state.homeworld}</div>
                            <div className="col s12 m6"><strong>Films: </strong>{this.state.films}</div>
                            <div className="col s12 m6"><strong>Species: </strong>{this.state.species}</div>
                        </div>
                    </div>
                </div>
            </div>)
    }
}

Details.contextTypes = {
    router: React.PropTypes.object.isRequired,
};
export default Details;