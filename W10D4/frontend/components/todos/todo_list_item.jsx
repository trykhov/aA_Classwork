
import React from 'react';

const TodoListItem = props => {
    let {id, title} = props;    
    return (
        <li key={id}>
            {title}
            <button onClick={() => props.done({id: id, title: title})}>
                Done
            </button>
            <button 
                onClick={() => props.remove({id: id, title: title})}
            >
                Remove
            </button>
        </li>)
}

export default TodoListItem;