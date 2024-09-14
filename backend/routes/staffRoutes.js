// routes/staffRoutes.js

const express = require('express');
const router = express.Router();
const Staff = require('../models/staffModel'); // Adjust path as needed
const path = require('path');
const multer = require('multer');

// Multer setup for file uploads
const storage = multer.diskStorage({
    destination: './uploads/', // Ensure this directory exists or handle directory creation
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname)); // Append timestamp to file name
    }
});
const upload = multer({ storage });

// Route to upload staff profile picture
router.post('/uploadProfilePicture', upload.single('profilePicture'), async (req, res) => {
    if (!req.file) {
        return res.status(400).json({ message: 'No file uploaded' });
    }
    try {
        const filePath = req.file.path; // Path to where the file is stored
        res.status(201).json({ filePath });
    } catch (error) {
        console.error('Error uploading profile picture:', error.message);
        res.status(500).json({ message: 'Failed to upload profile picture' });
    }
});

// Route to update staff profile picture
router.post('/updateStaffProfilePicture/:staffId', upload.single('profilePicture'), async (req, res) => {
    if (!req.file) {
        return res.status(400).json({ message: 'No file uploaded' });
    }

    try {
        const staffId = req.params.staffId;
        const filePath = req.file.path; // Path where the file is stored

        const staff = await Staff.findById(staffId);
        if (!staff) {
            return res.status(404).json({ message: 'Staff not found' });
        }

        staff.profilePicture = filePath; // Update staff with new profile picture path
        await staff.save();
        res.status(200).json({ message: 'Profile picture updated successfully', filePath });
    } catch (error) {
        console.error('Error updating profile picture:', error.message);
        res.status(500).json({ message: 'Failed to update profile picture' });
    }
});

// Route to fetch staff profile picture
router.get('/profilePicture/:staffId', async (req, res) => {
    try {
        const staff = await Staff.findById(req.params.staffId);
        if (!staff || !staff.profilePicture) {
            return res.status(404).json({ message: 'Profile picture not found' });
        }
        res.sendFile(path.resolve(staff.profilePicture));
    } catch (error) {
        console.error('Error fetching staff profile picture:', error.message);
        res.status(500).json({ message: 'Failed to fetch profile picture' });
    }
});

module.exports = router;
