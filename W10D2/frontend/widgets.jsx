import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tab from './tabs';

const tabs = [
    {title: "one", content: "i am the first"},
    {title: "two", content: "second pane here"},
    {title: "three", content: "third pane here"}
]

const Root = function() {
    return (
        <div>
            <Clock/>
            <Tab tab={tabs}/>
        </div>
    )
}


document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(Root(), root);
})