const mongoose = require('mongoose');

const assignedSubjectSchema = new mongoose.Schema({
  assignedSubjects: {
    type: [String],
    required: true,
  },
});

const AssignedSubject = mongoose.model('AssignedSubject', assignedSubjectSchema);

module.exports = AssignedSubject;
