import React, {Component} from 'react';
import {goToHome} from '../../helpers/go-to';

class Header extends Component {

    render() {
        return (
            <div id="header" onClick={goToHome.bind(this)}>
                <div className="container">
                    <div id="logo">
                        Desafio mLearn
                    </div>
                </div>
            </div>)
    }
}

Header.contextTypes = {
    router: React.PropTypes.object.isRequired,
};

export default Header;