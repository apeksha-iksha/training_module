import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import LoginForm from './LoginForm';

test('submitting the form calls onLogin with email and password', () => {
  const handleLogin = jest.fn();
  render(<LoginForm onLogin={handleLogin} />);

  fireEvent.change(screen.getByLabelText(/email/i), {
    target: { value: 'user@example.com' },
  });
  fireEvent.change(screen.getByLabelText(/password/i), {
    target: { value: 'secret123' },
  });
  fireEvent.click(screen.getByRole('button', { name: /log in/i }));

  expect(handleLogin).toHaveBeenCalledTimes(1);
  expect(handleLogin).toHaveBeenCalledWith({
    email: 'user@example.com',
    password: 'secret123',
  });
});
