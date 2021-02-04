import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { receiveAPokemon, requestSinglePokemon} from './actions/pokemon_actions'
import { fetchAPokemon } from './util/api_util';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  window.store = store
  window.receiveAPokemon = receiveAPokemon
  window.requestSinglePokemon = requestSinglePokemon
  window.fetchAPokemon = fetchAPokemon
  ReactDOM.render(<Root store={store} />, rootEl)
})