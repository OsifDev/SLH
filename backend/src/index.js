import express from 'express';
import sequelize from './config/db.js';
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('SLH Backend is Running!'));

sequelize.authenticate()
    .then(() => console.log('✅ Database connected'))
    .catch(err => console.error('❌ DB connection error:', err));

app.listen(PORT, () => console.log('🚀 Server running on port', PORT));
