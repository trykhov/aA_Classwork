const express = require('express');
const app = express();  // creates new express server
const db = require('./config/keys').mongoURI;
const mongoose = require('mongoose');


const bodyParser = require('body-parser');
const users = require('./routes/api/users');
const tweets = require('./routes/api/tweets');

const passport = require('passport'); // need to authenticate our tokens and construct private routes

mongoose.connect(db, { newUserUrlParser: true })
    .then(() => console.log("Connected to MongoDB successfully"))
    .catch(err => console.log(err))

// middleware
app.use(passport.initialize()); 
require('./config/passport')(passport); // require('./config/passport) will return a function that takes in passport
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
    
// calls the imported router and sets that path that will call the router
// (2nd argument) when directed to that path
app.use("/api/users", users);    
app.use("/api/tweets", tweets);

app.get("/", (req, res) => {
    res.send("Testing!");
});








const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Server is running on port ${port}`));

