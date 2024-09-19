const express = require('express');
const router = express.Router();
const AssignedSubject = require('../models/assignSubjectModel');

// Helper function to sort subjects
const sortSubjects = (subjects) => subjects.sort();

// Get already assigned subjects
router.get('/alreadyAssigned', async (req, res) => {
  try {
    const existingAssignment = await AssignedSubject.findOne();

    if (existingAssignment) {
      res.status(200).json({ subjects: sortSubjects(existingAssignment.assignedSubjects) });
    } else {
      // Return an empty array if no subjects are assigned
      res.status(200).json({ subjects: [] });
    }
  } catch (error) {
    res.status(500).json({ message: 'Error fetching assigned subjects', error: error.message });
  }
});

// Save or update assigned subjects
router.post('/assign', async (req, res) => {
  try {
    const { assignedSubjects } = req.body;

    // Check if subjects are provided
    if (!assignedSubjects || assignedSubjects.length === 0) {
      return res.status(400).json({ message: 'No subjects provided to assign.' });
    }

    // Find existing assignment
    let existingAssignment = await AssignedSubject.findOne();

    if (existingAssignment) {
      // Merge new subjects with existing ones
      existingAssignment.assignedSubjects = Array.from(new Set([...existingAssignment.assignedSubjects, ...assignedSubjects]));
      existingAssignment.assignedSubjects = sortSubjects(existingAssignment.assignedSubjects);
      await existingAssignment.save();
      res.status(200).json({ message: 'Subjects updated successfully!', data: existingAssignment });
    } else {
      // Create new assignment if none exists
      const newAssignment = new AssignedSubject({ assignedSubjects: sortSubjects(assignedSubjects) });
      await newAssignment.save();
      res.status(201).json({ message: 'Subjects assigned successfully!', data: newAssignment });
    }
  } catch (error) {
    res.status(500).json({ message: 'Error assigning subjects', error: error.message });
  }
});

// Remove assigned subjects
router.post('/remove', async (req, res) => {
  try {
    const { subjectsToRemove } = req.body;

    // Check if subjects to remove are provided
    if (!subjectsToRemove || subjectsToRemove.length === 0) {
      return res.status(400).json({ message: 'No subjects provided to remove.' });
    }

    const existingAssignment = await AssignedSubject.findOne();

    if (!existingAssignment) {
      return res.status(404).json({ message: 'No subjects found to remove.' });
    }

    // Filter out the subjects to remove
    existingAssignment.assignedSubjects = existingAssignment.assignedSubjects.filter(
      (subject) => !subjectsToRemove.includes(subject)
    );

    // Save the updated list
    existingAssignment.assignedSubjects = sortSubjects(existingAssignment.assignedSubjects);
    await existingAssignment.save();
    res.status(200).json({ message: 'Subjects removed successfully!', data: existingAssignment });
  } catch (error) {
    res.status(500).json({ message: 'Error removing subjects', error: error.message });
  }
});

module.exports = router;
