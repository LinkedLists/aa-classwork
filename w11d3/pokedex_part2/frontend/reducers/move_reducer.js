import { RECEIVE_A_POKEMON } from '../actions/pokemon_actions';

const moveReducer = (state = {}, action) => {
  // debugger
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_A_POKEMON:
      // let pokemon = { [action.payload.moves.id]: action.payload.moves}
      return Object.assign({}, state, action.payload.moves);
    default:
      return state;

  }
}

export default moveReducer;