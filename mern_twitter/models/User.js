const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// how the User schema in the database will look like 
const UserSchema = new Schema({
    handle: {
      type: String,
      required: true
    },
    email: {
      type: String,
      required: true
    },
    password: {
      type: String,
      required: true
    },
    date: {
      type: Date,
      default: Date.now
    }
  });

  module.exports = User = mongoose.model('User', UserSchema);