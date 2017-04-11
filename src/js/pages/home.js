import React, {Component} from 'react';
import ContentList from '../components/components/content-list';
import axios from 'axios';

import Header from '../components/components/header';

class Home extends Component {

    constructor(props) {
        super(props);
        this.state = {
            people: [],
        }
    }

    componentWillMount() {
        const context = this;
        axios.get('http://swapi.co/api/people/')
            .then(function (response) {
                context.setState({
                    people: response.data.results,
                })
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    render() {
        return (
            <div id="p-home">
                <Header />
                <ContentList people={this.state.people}/>
            </div>)
    }
}

Home.contextTypes = {
    router: React.PropTypes.object.isRequired,
};

export default Home;