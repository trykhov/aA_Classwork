import React from 'react';

class SignUp extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            username: '',
            email: '',
            password: ''
        }
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return e => {
            this.setState({
                [type]: e.target.value
            })
        }
    }

    handleSubmit(e) {
        e.preventDefault;
        // createNewUser is a prop of SignUp from the signup_container
        this.props.createNewUser(this.state)
            // changes the url to the /chirps
            .then(() => this.props.history.push('/chirps'));
    }

    render() {
        const { username, email, password } = this.state;
        return (
            <section className="session-form">
                <h2>Sign Up!</h2>
                <form action="">
                    <label> Username:
                        <input type="text" 
                               value={username}
                               onChange={this.handleInput('username')}
                        />
                    </label>
                    <label> Email:
                        <input type="text" 
                               value={email}
                               onChange={this.handleInput('email')}
                        />
                    </label>
                    <label> Password:
                        <input type="password" 
                               value={password}
                               onChange={this.handleInput('password')}
                        />
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>
            </section>
        )
    }
}

export default SignUp;

