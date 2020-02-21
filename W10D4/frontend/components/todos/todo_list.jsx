import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = props => {
    // debugger
    const { todos } = props;
    
    const allItems = todos.map(todo => {
        return <TodoListItem 
                id={todo.id}
                key={todo.id} 
                title={todo.title} 
                done={props.receiveTodo}
                remove={props.removeTodo}
              />
    })
    return (
        <div>
            <ul>
                {allItems}
            </ul>
            <TodoForm receiveTodo={props.receiveTodo}/>
        </div>
    )
};

export default TodoList;