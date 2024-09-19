const express = require('express');
const router = express.Router();
const User = require('../models/userModel');
const ProfileSettings = require('../models/profileSettingsModel');
const upload = require('../config/gridfsStorage');
const { body, validationResult } = require('express-validator');

// Validation middleware
const validateProfileData = [
  body('name').optional().notEmpty().withMessage('Name is required'),
  body('mobile').optional().notEmpty().withMessage('Mobile is required'),
  body('email').isEmail().withMessage('Invalid email format'),
  // Additional validations can be added here
];

router.put('/', validateProfileData, upload.single('profileLogo'), async (req, res) => {
  // Check validation results
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  try {
    const {
      instituteName,
      country,
      city,
      branchName,
      feeRecHeader,
      branchAddress,
      taxNo,
      feeFooter,
      logoDisplay,
      feeStatusDisplay,
      chatOption,
      name,
      mobile,
      email,
      year
    } = req.body;

    if (!email) {
      return res.status(400).json({ message: 'Email is required' });
    }

    const profileSettingsData = {
      instituteName,
      country,
      city,
      branchName,
      feeRecHeader,
      branchAddress,
      taxNo,
      feeFooter,
      logoDisplay,
      feeStatusDisplay,
      chatOption,
      profileLogo: req.file ? req.file.filename : null
    };

    const userData = {
      name,
      mobile,
      email,
      year
    };

    // Update ProfileSettings and User
    const updatedProfileSettings = await ProfileSettings.findOneAndUpdate(
      { email },
      profileSettingsData,
      { new: true, upsert: true, runValidators: true }
    );

    const updatedUser = await User.findOneAndUpdate(
      { email },
      userData,
      { new: true, runValidators: true }
    );

    if (!updatedProfileSettings || !updatedUser) {
      return res.status(404).json({ message: 'Profile settings or user not found' });
    }

    res.status(200).json({
      message: 'User profile and settings updated successfully',
      user: updatedUser,
      profileSettings: updatedProfileSettings
    });
  } catch (error) {
    console.error('Error updating profile:', error);
    res.status(500).json({ message: 'Internal server error', error });
  }
});

module.exports = router;
