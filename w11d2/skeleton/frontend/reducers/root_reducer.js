import { combineReducers } from 'redux';
import entityReducer from './entities_reducer';


const rootReducer = combineReducers({
  entities: entityReducer

})

export default rootReducer;