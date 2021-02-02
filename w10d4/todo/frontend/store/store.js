import { createStore } from 'redux';
import rootReducer from '../reducers/root-reducer';

const configureStore = (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState ) // (rootReducer, preloadedState)
}
export default configureStore;