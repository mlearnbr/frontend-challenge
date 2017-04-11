import React, {Component} from 'react';

import ContentItem from '../objects/content-Item';

class ContentList extends Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="container">
                <div id="content-list" className="row">
                    {this.props.people.map((item, key) => {
                        return <ContentItem key={key} data={item} />
                    })}
                </div>
            </div>)
    }
}

ContentList.contextTypes = {
    router: React.PropTypes.object.isRequired,
};

export default ContentList;