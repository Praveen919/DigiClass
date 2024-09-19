const express = require('express');
const router = express.Router();
const Year = require('../models/yearModel');

// Function to format date to dd/MM/yyyy
const formatDate = (date) => {
  const d = new Date(date);
  const day = String(d.getDate()).padStart(2, '0');
  const month = String(d.getMonth() + 1).padStart(2, '0');
  const year = d.getFullYear();
  return `${day}/${month}/${year}`;
};

// Function to parse dd/MM/yyyy date string to Date object
const parseDate = (dateString) => {
  const [day, month, year] = dateString.split('/').map(Number);
  // Handle invalid date formats
  if (isNaN(day) || isNaN(month) || isNaN(year) || day > 31 || month > 12 || day === 0 || month === 0) {
    throw new Error('Invalid date format');
  }
  // Handle cases where day is out of range for the month
  if (day > new Date(year, month, 0).getDate()) {
    throw new Error('Day out of range for the month');
  }
  return new Date(year, month - 1, day);
};

// Add a new Year
router.post('/add', async (req, res) => {
  try {
    let { yearName, fromDate, toDate, remarks } = req.body;

    // Convert dates from dd/MM/yyyy to Date objects
    if (fromDate && toDate) {
      fromDate = parseDate(fromDate);
      toDate = parseDate(toDate);
    } else {
      return res.status(400).json({ message: 'Dates are required' });
    }

    // Create a new Year instance
    const newYear = new Year({
      yearName,
      fromDate,
      toDate,
      remarks,
    });

    // Save to the database
    await newYear.save();
    res.status(201).json({ message: 'Year added successfully!', year: newYear });
  } catch (error) {
    console.error('Error adding year:', error); // Log error for debugging
    res.status(400).json({ message: 'Error adding year', error: error.message });
  }
});

// Get list of all Years
router.get('/list', async (req, res) => {
  try {
    const years = await Year.find(); // Fetch all years

    // Convert dates to dd/MM/yyyy format before sending
    const formattedYears = years.map(year => ({
      ...year.toObject(),
      fromDate: formatDate(year.fromDate),
      toDate: formatDate(year.toDate),
    }));

    res.status(200).json(formattedYears);
  } catch (error) {
    console.error('Error fetching years:', error); // Log error for debugging
    res.status(500).json({ message: 'Error fetching years', error: error.message });
  }
});

// Edit a Year by ID
router.put('/edit/:id', async (req, res) => {
  try {
    const { yearName, fromDate, toDate, remarks } = req.body;
    const year = await Year.findById(req.params.id);

    if (!year) {
      return res.status(404).json({ message: 'Year not found' });
    }

    // Update fields only if provided
    if (yearName) year.yearName = yearName;
    if (fromDate) year.fromDate = parseDate(fromDate);
    if (toDate) year.toDate = parseDate(toDate);
    if (remarks) year.remarks = remarks;

    // Save changes to database
    await year.save();
    res.status(200).json({ message: 'Year updated successfully!', year });
  } catch (error) {
    console.error('Error updating year:', error); // Log error for debugging
    res.status(400).json({ message: 'Error updating year', error: error.message });
  }
});

// Delete a Year by ID
router.delete('/delete/:id', async (req, res) => {
  try {
    const year = await Year.findById(req.params.id);

    if (!year) {
      return res.status(404).json({ message: 'Year not found' });
    }

    // Delete the year
    await year.deleteOne();
    res.status(200).json({ message: 'Year deleted successfully!' });
  } catch (error) {
    console.error('Error deleting year:', error); // Log error for debugging
    res.status(400).json({ message: 'Error deleting year', error: error.message });
  }
});

module.exports = router;
