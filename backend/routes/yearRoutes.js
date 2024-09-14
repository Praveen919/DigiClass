// routes/yearRoutes.js

const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');

// Define Year Schema and Model
const yearSchema = new mongoose.Schema({
    yearName: { type: String, required: true },
    fromDate: { type: String, required: true },
    toDate: { type: String, required: true },
    remarks: { type: String },
});

const Year = mongoose.model('Year', yearSchema);

// POST route to add a year
router.post('/add-year', async (req, res) => {
    const { yearName, fromDate, toDate, remarks } = req.body;

    // Validate the required fields
    if (!yearName || !fromDate || !toDate) {
        return res.status(400).json({ message: 'Please provide all required fields' });
    }

    try {
        // Create a new year entry and save it to the database
        const newYear = new Year({ yearName, fromDate, toDate, remarks });
        await newYear.save();

        // Respond with a success message
        res.status(200).json({ message: 'Year added successfully' });
    } catch (error) {
        console.error('Error adding year:', error);
        res.status(500).json({ message: 'Failed to add year' });
    }
});

module.exports = router;
