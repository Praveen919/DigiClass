const express = require('express');
const router = express.Router();
const AssignedStandard = require('../models/assignStandardModel');

// Function to sort standards numerically
const sortStandardsNumerically = (standards) => {
  return standards.sort((a, b) => {
    // Extract numbers from strings like '5th Standard', '11th Science'
    const numA = parseInt(a.match(/\d+/)?.[0] || '0', 10);
    const numB = parseInt(b.match(/\d+/)?.[0] || '0', 10);

    return numA - numB;
  });
};

// Get Already Assigned Standards
router.get('/alreadyAssigned', async (req, res) => {
  try {
    const existingAssignment = await AssignedStandard.findOne();

    if (existingAssignment) {
      res.status(200).json({ standards: sortStandardsNumerically(existingAssignment.standards) });
    } else {
      res.status(404).json({ message: 'No assigned standards found' });
    }
  } catch (error) {
    res.status(500).json({ message: 'Error fetching assigned standards', error: error.message });
  }
});

// Save or Update Assigned Standards
router.post('/assign', async (req, res) => {
  try {
    const { standards, hasOtherRequirements } = req.body;

    // Find an existing assignment
    let existingAssignment = await AssignedStandard.findOne();

    if (existingAssignment) {
      // Update existing assignment by adding new standards
      existingAssignment.standards = Array.from(new Set([...existingAssignment.standards, ...standards]));
      existingAssignment.standards = sortStandardsNumerically(existingAssignment.standards);
      await existingAssignment.save();
      res.status(200).json({ message: 'Standards updated successfully!', data: existingAssignment });
    } else {
      // Create new assignment
      const newAssignment = new AssignedStandard({ standards: sortStandardsNumerically(standards) });
      await newAssignment.save();
      res.status(201).json({ message: 'Standards assigned successfully!', data: newAssignment });
    }
  } catch (error) {
    res.status(500).json({ message: 'Error assigning standards', error: error.message });
  }
});

// Remove Assigned Standard
router.post('/remove', async (req, res) => {
  try {
    const { standardsToRemove } = req.body;

    const existingAssignment = await AssignedStandard.findOne();

    if (!existingAssignment) {
      return res.status(404).json({ message: 'No standards found to remove' });
    }

    // Remove specified standards
    existingAssignment.standards = existingAssignment.standards.filter(standard => !standardsToRemove.includes(standard));
    existingAssignment.standards = sortStandardsNumerically(existingAssignment.standards);
    await existingAssignment.save();
    res.status(200).json({ message: 'Standards removed successfully!', data: existingAssignment });
  } catch (error) {
    res.status(500).json({ message: 'Error removing standards', error: error.message });
  }
});

module.exports = router;
