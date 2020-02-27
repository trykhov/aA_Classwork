import * as APIUtil from '../util/session_api_util';

// type
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const REMOVE_CURRENT_USER = "REMOVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

// regular action creators
export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})

export const logoutCurrentUser = () => ({
  type: REMOVE_CURRENT_USER
})

export const receiveErrors = (errors = []) => ({
  type: RECEIVE_ERRORS,
  errors: errors
})

// action thunk creators
export const login = user => dispatch => {
  return APIUtil.login(user)
          .then(userRes => dispatch(receiveCurrentUser(userRes)));
}

export const logout = () => dispatch => {
  return APIUtil.logout().then(() => dispatch(logoutCurrentUser()));
}

export const signup = user => dispatch => {
  return APIUtil.signup(user)
          .then(userRes => dispatch(receiveCurrentUser(userRes)));
}