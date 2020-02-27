import React from 'react';

class Login extends React.Component {

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
        this.props.login(this.state)
            .then(() => this.props.history.push('/chirps'))
    }


    render() {
        const { username, email, password } = this.state;
        return (
            <section className="session-form">
                <h2>Log In!</h2>
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
                    <button onClick={this.handleSubmit}>Log In</button>
                </form>
            </section>
        )
    }
}


export default Login;