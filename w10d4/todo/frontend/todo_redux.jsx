import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, removeTodo, receiveTodos } from './actions/todo_actions';
import { receiveStep, removeStep, receiveSteps } from './actions/step_actions';//change to steps
import configureStore from './store/store';
import Root from './components/root';
import {allTodos} from './reducers/selectors';





const todos = { 
    1:  { id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false },
    2:  { id: 2, title: 'Pass React', body: 'do this', done: true },
    3:  { id: 3, title: 'Finish Project', body: 'W10D5', done: false }
};

const steps = {
    1:  { id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }
};

const preloadedState = {
    todos, //todos: todos
    steps, //steps: steps
};


// const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 3, title: 'Learn Redux', body: 'It is fundamental', done: false }];

// const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 1, title: 'Dispatch actions', done: false, todo_id: 2 }];

document.addEventListener("DOMContentLoaded", () => {
    // window.store = configureStore();
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;
    window.allTodos = allTodos;

    // const preloadedState = localStorage.state ?
    // JSON.parse(localStorage.state) : {};

    // const store = configureStore(preloadedState);

    const store = configureStore(preloadedState);
    window.store = store;

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root); 
});