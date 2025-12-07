import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

const dbUrl = process.env.DATABASE_URL;
if (!dbUrl) {
  console.error('❌ ERROR: DATABASE_URL is missing from .env');
  process.exit(1);
}

const sequelize = new Sequelize(dbUrl, {
  dialect: 'postgres',
  logging: false
});

export default sequelize;
