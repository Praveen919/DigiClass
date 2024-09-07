const express = require('express');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const multer = require('multer');
const { GridFsStorage } = require('multer-gridfs-storage');
const Grid = require('gridfs-stream');
const path = require('path');
const crypto = require('crypto');

// Initialize Express app
const app = express();
app.use(bodyParser.json());
app.use(cors()); // Allow cross-origin requests from Flutter

// MongoDB connection using Mongoose
const uri = 'mongodb+srv://praveennaidu297:db-pass.@cluster0.qddnp.mongodb.net/DigiClass?retryWrites=true&w=majority';
mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => {
    console.log('Connected to MongoDB with Mongoose');
}).catch((error) => {
    console.error('Failed to connect to MongoDB', error);
    process.exit(1);
});

// Init gfs
let gfs;
const conn = mongoose.connection;
conn.once('open', () => {
    // Init stream
    gfs = Grid(conn.db, mongoose.mongo);
    gfs.collection('uploads'); // Collection to store files
});

// Define Mongoose schema and model for User
const userSchema = new mongoose.Schema({
    instituteName: { type: String, required: true },
    country: { type: String, required: true },
    city: { type: String, required: true },
    name: { type: String, required: true },
    mobile: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true }
});

const User = mongoose.model('User', userSchema);

// User registration route
app.post('/register', async (req, res) => {
    const { instituteName, country, city, name, mobile, email, password } = req.body;

    if (!instituteName || !country || !city || !name || !mobile || !email || !password) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    try {
        // Check if the user already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(409).json({ message: 'Email already exists' });
        }

        // Hash the password and save the user
        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = new User({
            instituteName,
            country,
            city,
            name,
            mobile,
            email,
            password: hashedPassword
        });

        await newUser.save();
        res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
        console.error('Error during registration:', error.message);
        res.status(500).json({ message: 'Error registering user' });
    }
});

// User login route
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ message: 'Email and password are required' });
    }

    try {
        // Find the user by email
        const user = await User.findOne({ email });

        if (user) {
            const match = await bcrypt.compare(password, user.password);

            if (match) {
                res.status(200).json({ message: 'Login successful' });
            } else {
                res.status(401).json({ message: 'Invalid credentials' });
            }
        } else {
            res.status(404).json({ message: 'User not found' });
        }
    } catch (error) {
        console.error('Error during login:', error.message);
        res.status(500).json({ message: 'Error logging in' });
    }
});

// Create storage engine for GridFS
const storage = new GridFsStorage({
    url: uri,
    file: (req, file) => {
        return new Promise((resolve, reject) => {
            crypto.randomBytes(16, (err, buf) => {
                if (err) {
                    return reject(err);
                }
                const filename = buf.toString('hex') + path.extname(file.originalname);
                const fileInfo = {
                    filename: filename,
                    bucketName: 'uploads' // This should match the collection name
                };
                resolve(fileInfo);
            });
        });
    }
});
const upload = multer({ storage });

// POST route for creating study materials and storing files in MongoDB
app.post('/study-materials', upload.single('file'), (req, res) => {
    const { courseName, standard, subject } = req.body;

    if (!courseName || !standard || !subject || !req.file) {
        return res.status(400).json({ message: 'Please provide all required fields and file' });
    }

    // The file is now stored in MongoDB GridFS, and the details can be saved in a separate collection if needed
    res.status(201).json({
        message: 'Study material created successfully',
        fileId: req.file.id, // You can save this file ID in your database if you need to reference the file later
        filename: req.file.filename
    });
});

// Route to download a file by filename
app.get('/files/:filename', (req, res) => {
    gfs.files.findOne({ filename: req.params.filename }, (err, file) => {
        if (!file || file.length === 0) {
            return res.status(404).json({ message: 'No file found' });
        }

        // If the file is found, stream it to the client
        const readstream = gfs.createReadStream(file.filename);
        readstream.pipe(res);
    });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
