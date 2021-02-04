import {combineReducers} from 'redux';
import itemReducer from './item_reducer';
import moveReducer from './move_reducer';
import pokemonReducer from './pokemon_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  item: itemReducer,
  move: moveReducer
})

export default entitiesReducer;