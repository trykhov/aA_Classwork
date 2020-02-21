import React from 'react';

class TodoForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            id: "",
            title: ""
        };
        this.createTitle = this.createTitle.bind(this);
        this.submitForm = this.submitForm.bind(this);
        this.uniqueId = this.uniqueId.bind(this);
    }

    uniqueId() {
        return new Date().getTime();
    }

    createTitle(e) {
        this.setState({title: e.target.value});
    }

    submitForm(e) {
        e.preventDefault();
        this.props.receiveTodo({id: this.uniqueId(), title: this.state.title})
        this.setState({
            id: "",
            title: ""
        })
    }

    render() {
        return (
            <form onSubmit={this.submitForm}>
                <label>Title: </label>
                <input onChange={this.createTitle} type="text" value={this.state.title}/>
                <input type="submit"/>
            </form>
        )
    }
}

export default TodoForm;