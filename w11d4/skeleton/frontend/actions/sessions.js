import {postSession, postUser, deleteSession} from '../utils/sessions';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user,
})

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
})

export const createNewUser = formUser => dispatch => postUser(formUser) //takes a user obj from a form
.then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
.then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession()
.then(() => dispatch(logoutCurrentUser()));
