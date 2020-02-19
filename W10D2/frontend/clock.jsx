import React from 'react';

class Clock extends React.Component {

    constructor() {
        super();
        const date = new Date();
        this.state = {
            today: date.toDateString(),
            // time: `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`
            time: date.toTimeString().substring(0,8)
        };
        this.intervalID = null;
        this.tick = this.tick.bind(this);
    }

    tick() {
        let date = new Date();
        this.setState({
            today: date.toDateString(),
            // time: `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`
            time: date.toTimeString().substring(0,8)
        })
    }

    componentDidMount() {
        this.intervalID = setInterval(() => {
            this.tick()
        }, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalID);
    }

    render() {
        return (
            <section id="clock">
                <h1>Clock</h1>
                <div id="clock-container">
                    <div className="clock-info">
                        <span>Time:</span>
                        <span>{this.state.time} PDT</span>
                    </div>
                    <div className="clock-info">
                        <span>Date:</span>
                        <span>{this.state.today}</span>
                    </div>
                </div>
            </section>
        )
    }

}


export default Clock;