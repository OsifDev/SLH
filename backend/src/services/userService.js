import User from '../models/User.js';

export async function createUser(username, email) {
  return await User.create({ username, email });
}
