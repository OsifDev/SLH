import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

export default function App() {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<h1>SLH Web Frontend is Running!</h1>} />
      </Routes>
    </Router>
  );
}
