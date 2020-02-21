export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos = []) => {
    // todos is an array 
    return {
        type: RECEIVE_TODOS,
        todos: todos // array of todo objects
    }
}

export const receiveTodo = todo => {
    // todo is an object
    return  {
        type: RECEIVE_TODO,
        todo: todo
    }
}

export const removeTodo = todo => {
    // removes a todo object
    return {
        type: REMOVE_TODO,
        todo: todo
    }
}