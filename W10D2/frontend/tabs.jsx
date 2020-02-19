import React from 'react';

class Tab extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            currIdx: 0,
            content: this.props.tab[0].content
        }
    }

    isActive(idx) { // make class active for selected
        if(this.state.currIdx === idx) return "active";
    }

    switchTab(idx) {
        this.setState({currIdx: idx, content: this.props.tab[idx].content});
    }

    createTabs() {
        return this.props.tab.map((tab, idx) => {
            return (
                <span
                    key={idx}
                    className={`${this.isActive(idx)} header`}
                    onClick={() => this.switchTab(idx)}
                >
                    {tab.title}
                </span>
            )
        })
    }

    render() {
        return (
            <section id="tabs">
                <h1>Tabs</h1>
                <div id="tabs-container">
                    <div id="tabs-headers">
                        {this.createTabs()}
                    </div>
                    <div id="tabs-content">
                        {this.state.content}
                    </div>
                </div>
            </section>
        )
    }
}


export default Tab;