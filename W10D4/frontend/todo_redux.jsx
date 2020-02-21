import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { receiveTodos, receiveTodo, removeTodo } from './actions/todo_actions';
import {allTodos} from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById('root');

    window.store = configureStore;
    window.getState = store.getState;
    const newTodos = [{ id: 1, title: 'do dishes' }, { id: 2, title: 'code' }];
    store.dispatch(receiveTodos(newTodos));
    store.dispatch(receiveTodo({ id: 3, title: "New Todo" }));
    // store.dispatch(removeTodo({ id: 1, title: 'do dishes' }))
    // console.log(allTodos(window.getState()));
    

    ReactDOM.render(<Root store={window.store}/>, root);
})