const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    instituteName: { type: String },
    country: { type: String },
    city: { type: String },
    name: { type: String, required: true },
    mobile: { type: String, required: true },
    email: { type: String, required: true},
    password: { type: String, required: true },
    role: { type: String, enum: ['Admin', 'Teacher', 'Student'], required: true },
    branch: { type: String },
    year: { type: String },
    feeRecHeader: { type: String },
    branchAddress: { type: String },
    taxNo: { type: String },
    feeFooter: { type: String },
    logoDisplay: { type: String },
    feeStatusDisplay: { type: String },
    chatOption: { type: String },
    profileLogo: { type: String }, // File reference from GridFS
});

module.exports = mongoose.model('User', userSchema);
