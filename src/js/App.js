import React, { Component } from 'react'
import App from 'grommet/components/App';

class ThemedApp extends Component {

    render() {
        return (
            <App centered={false}>
                <div className='activity-container'>
                    {React.cloneElement(this.props.children, ...this.props)}
                </div>
            </App>
        );
    }
}

ThemedApp.contextTypes = {
    router: React.PropTypes.object
};

export default ThemedApp;
