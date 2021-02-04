import { RECEIVE_A_POKEMON } from '../actions/pokemon_actions';

const itemReducer = (state = {}, action) => {
  // debugger
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_A_POKEMON: 
      // let pokemon = { [action.payload.pokemon.id]: action.payload.items}
      return Object.assign({}, state, action.payload.items);
    default:
      return state;

  }
}

export default itemReducer;