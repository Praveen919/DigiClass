const mongoose = require('mongoose');

const staffSchema = new mongoose.Schema({
    firstName: { type: String, required: true },
    middleName: { type: String },
    lastName: { type: String, required: true },
    gender: { type: String, required: true },
    mobile: { type: String, required: true, unique: true },
    email: { type: String },
    address: { type: String },
    profilePicture: { type: String }
});

const Staff = mongoose.model('Staff', staffSchema);

module.exports = Staff;
