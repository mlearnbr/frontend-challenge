const assign = (state, props) => Object.assign({}, state, props);

let initialState = {
    authenticated: false,
    user: null,
    redirectUrl: null,
};

export default (state = initialState, payload) => {

    let newState;

    switch (payload.type){

        case 'SET_AUTH_REDIRECT_URL':

            newState = assign(state, {
               redirectUrl: payload.redirectUrl,
            });
            break;

        default:

            newState = state;
            break;

    }

    return newState;
}
