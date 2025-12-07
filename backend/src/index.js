import express from 'express';
import dotenv from 'dotenv';
import sequelize from './config/db.js';

dotenv.config();
const app = express();
app.use(express.json());

app.get('/', (req, res) => res.send('SLH Backend is running!'));

const PORT = process.env.PORT || 3000;
sequelize.authenticate().then(() => {
    console.log('✅ Database connected');
    app.listen(PORT, () => console.log(🚀 Server running on port ));
}).catch(err => {
    console.error('❌ Database connection failed:', err);
});
