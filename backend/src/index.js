import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import apiRouter from './routes/api.js';
dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', apiRouter);

const PORT = process.env.PORT || 3000;
app.get('/', (req, res) => res.send('🚀 SLH Backend Running!'));
app.listen(PORT, () => console.log(🚀 SLH Backend listening on port ));
