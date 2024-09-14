require('dotenv').config(); // Load environment variables from .env file
const app = require('./config/app');
const gfs = require('./config/config'); // Initialize GridFS if needed

// Import existing routes
const authRoutes = require('./routes/authRoutes');
const staffRoutes = require('./routes/staffRoutes');
const studyMaterialRoutes = require('./routes/studyMaterialRoutes');
const passwordRoutes = require('./routes/passwordRoutes');
const yearRoutes = require('./routes/yearRoutes');

// Import new routes
const mcqExamRoutes = require('./routes/mcqExamRoutes');
const examRoutes = require('./routes/examRoutes');
const assignmentRoutes = require('./routes/assignmentRoutes');
const documentRoutes = require('./routes/documentRoutes');
const feeStructureRoutes = require('./routes/feeStructureRoutes');

// Use existing routes
app.use('/api/auth', authRoutes);
app.use('/api/staff', staffRoutes);
app.use('/api/study-material', studyMaterialRoutes);
app.use('/api/password', passwordRoutes);
app.use('/api/years', yearRoutes);

// Use new routes
app.use('/api/mcq-exams', mcqExamRoutes);
app.use('./api/exams', examRoutes);
app.use('/api/assignments', assignmentRoutes);
app.use('/api/documents', documentRoutes);
app.use('/api/fee-structures', feeStructureRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
