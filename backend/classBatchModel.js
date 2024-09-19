const mongoose = require('mongoose');

const classBatchSchema = new mongoose.Schema({
  classBatchName: { type: String, required: true, unique: true },
  strength: { type: Number, required: true },
  fromTime: { type: String, required: true },
  toTime: { type: String, required: true }
});

module.exports = mongoose.model('ClassBatch', classBatchSchema);
