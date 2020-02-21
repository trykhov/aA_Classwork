import React from 'react';
import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';

// maps key as props to component
// eg: todo will be a prop of TodoList
const mapStateToProps = state => ({
    todos: allTodos(state)
})

// maps a dispatch as a prop to TodoList
// TodoList.props.receiveTodo(arg) => will trigger dispatch and change state
const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: todo => dispatch(removeTodo(todo))
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);