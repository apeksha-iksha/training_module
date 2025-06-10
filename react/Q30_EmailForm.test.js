import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import EmailForm from './EmailForm';

test('shows error on invalid email and calls onSubmit on valid', () => {
  const handleSubmit = jest.fn();
  render(<EmailForm onSubmit={handleSubmit} />);

  const input = screen.getByLabelText(/email:/i);
  const button = screen.getByText('Submit');

  // Invalid email
  fireEvent.change(input, { target: { value: 'not-an-email' } });
  fireEvent.click(button);
  expect(screen.getByText('Please enter a valid email.')).toBeInTheDocument();
  expect(handleSubmit).not.toHaveBeenCalled();

  // Valid email
  fireEvent.change(input, { target: { value: 'user@example.com' } });
  fireEvent.click(button);
  expect(screen.queryByText('Please enter a valid email.')).toBeNull();
  expect(handleSubmit).toHaveBeenCalledWith('user@example.com');
});
