const express = require('express');
const router = express.Router();
const ClassBatch = require('../models/classBatchModel');

// Create a new class/batch
router.post('/', async (req, res) => {
  try {
    const { classBatchName, strength, fromTime, toTime } = req.body;

    if (!classBatchName || !strength || !fromTime || !toTime) {
      return res.status(400).json({ message: 'All fields are required' });
    }

    // Check if a class/batch with the same name already exists
    const existingClassBatch = await ClassBatch.findOne({ classBatchName });
    if (existingClassBatch) {
      return res.status(400).json({ message: 'Class/Batch already exists with that name' });
    }

    const newClassBatch = new ClassBatch({
      classBatchName,
      strength,
      fromTime,
      toTime
    });

    await newClassBatch.save();
    res.status(201).json({ message: 'Class/Batch created successfully!', classBatch: newClassBatch });
  } catch (error) {
    console.error('Error creating Class/Batch:', error);
    res.status(500).json({ message: 'Error creating Class/Batch', error: error.message });
  }
});

// Get all class/batches
router.get('/', async (req, res) => {
  try {
    const classBatches = await ClassBatch.find();
    res.status(200).json(classBatches);
  } catch (error) {
    console.error('Error fetching Class/Batches:', error);
    res.status(500).json({ message: 'Error fetching Class/Batches', error: error.message });
  }
});

// Get a specific class/batch by id
router.get('/:id', async (req, res) => {
  try {
    const classBatch = await ClassBatch.findById(req.params.id);
    if (classBatch) {
      res.status(200).json(classBatch);
    } else {
      res.status(404).json({ message: 'Class/Batch not found' });
    }
  } catch (error) {
    console.error('Error fetching Class/Batch by id:', error);
    res.status(500).json({ message: 'Error fetching Class/Batch by id', error: error.message });
  }
});

// Update a class/batch by id
router.put('/:id', async (req, res) => {
  try {
    const { classBatchName, strength, fromTime, toTime } = req.body;

    if (!classBatchName || !strength || !fromTime || !toTime) {
      return res.status(400).json({ message: 'All fields are required' });
    }

    // Check if the new class/batch name already exists (excluding the current one)
    const existingClassBatch = await ClassBatch.findOne({ classBatchName, _id: { $ne: req.params.id } });
    if (existingClassBatch) {
      return res.status(400).json({ message: 'Class/Batch already exists with that name' });
    }

    const updatedClassBatch = await ClassBatch.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true, runValidators: true }
    );

    if (updatedClassBatch) {
      res.status(200).json(updatedClassBatch);
    } else {
      res.status(404).json({ message: 'Class/Batch not found' });
    }
  } catch (error) {
    console.error('Error updating Class/Batch:', error);
    res.status(400).json({ message: 'Error updating Class/Batch', error: error.message });
  }
});

// Delete a class/batch by id
router.delete('/:id', async (req, res) => {
  try {
    const deletedClassBatch = await ClassBatch.findByIdAndDelete(req.params.id);
    if (deletedClassBatch) {
      res.status(200).json({ message: 'Class/Batch deleted' });
    } else {
      res.status(404).json({ message: 'Class/Batch not found' });
    }
  } catch (error) {
    console.error('Error deleting Class/Batch:', error);
    res.status(500).json({ message: 'Error deleting Class/Batch', error: error.message });
  }
});

module.exports = router;
