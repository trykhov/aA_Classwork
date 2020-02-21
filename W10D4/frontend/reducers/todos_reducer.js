import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';

const todosReducer = (prevState = {}, action) => {
    const newState = Object.assign({}, prevState);
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach(todo => {
                let key = todo.id;
                newState[key] = todo;
            })
            break;
        case RECEIVE_TODO:
            let key = action.todo.id;
            newState[key] = action.todo;
            break;
        case REMOVE_TODO:            
            key = action.todo.id;
            if(newState[key]) delete newState[key];
            break;
        default:
          return prevState;
    }
    return newState;
}

  
  export default todosReducer;