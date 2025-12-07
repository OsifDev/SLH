import express from 'express';
import sequelize from './config/db.js';

const app = express();
app.use(express.json());

app.get('/', (req, res) => res.send('SLH Backend Running!'));

const PORT = process.env.PORT || 3000;
app.listen(PORT, async () => {
    try {
        await sequelize.authenticate();
        console.log('✅ Database connected!');
    } catch (err) {
        console.error('❌ DB Connection failed:', err);
    }
    console.log('🚀 Server running on port', PORT);
});
