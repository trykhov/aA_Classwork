const Validator = require('validator');
const validText = require('./valid-text');

module.exports = function validateTweetInput(tweet) {
    let errors = {};

    tweet.text = validText(tweet.text) ? tweet.text : "";

    // determine if the tweet is between 5 to 140 characters
    if(!Validator.isLength(tweet.text, { min: 5, max: 140 })) {
        errors.text = 'Tweet must be between 5 and 140 characters';
    }

    // if the tweet is empty, return error
    if(Validator.isEmpty(tweet.text)) {
        errors.text = "Text field is required";
    }

    return (
        { errors, 
          isValid: Object.keys(errors).length === 0
        }
    );
}