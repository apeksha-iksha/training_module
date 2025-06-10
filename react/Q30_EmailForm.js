import React, { useState } from 'react';
import PropTypes from 'prop-types';

function EmailForm({ onSubmit }) {
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');

  const validateEmail = (value) =>
    /\S+@\S+\.\S+/.test(value);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!validateEmail(email)) {
      setError('Please enter a valid email.');
    } else {
      setError('');
      onSubmit(email);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="email">Email:</label>
      <input
        id="email"
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
      />
      {error && <span style={{ color: 'red' }}>{error}</span>}
      <button type="submit">Submit</button>
    </form>
  );
}

EmailForm.propTypes = {
  onSubmit: PropTypes.func.isRequired,
};

export default EmailForm;

