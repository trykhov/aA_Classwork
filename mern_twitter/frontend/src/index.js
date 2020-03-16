import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import jwt_decode from 'jwt-decode'; // We will use this to parse the user's session token
import { setAuthToken } from './util/session_api_util';
import { logout } from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (localStorage.jwtToken) { 
    setAuthToken(localStorage.jwtToken); // Set the token as a common header for all axios requests
    const decodedUser = jwt_decode(localStorage.jwtToken); // Decode the token to obtain the user's information
    const preloadedState = { session: { isAuthenticated: true, user: decodedUser } }; // Create a preconfigured state we can immediately add to our store
    store = configureStore(preloadedState);
    const currentTime = Date.now() / 1000;
    // If the user's token has expired
    if (decodedUser.exp < currentTime) {
      // Logout the user and redirect to the login page
      store.dispatch(logout());
      window.location.href = '/login'; // send use back to login page
    }
  } else {
    store = configureStore({}); // If this is a first time user, start with an empty store
  }
  // Render our root component and pass in the store as a prop
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});