import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import NameForm from './Q25_NameForm';

test('updates name on input change', () => {
  render(<NameForm />);
  const input = screen.getByPlaceholderText('Enter your name');
  fireEvent.change(input, { target: { value: 'Apeksha' } });
  expect(screen.getByText('Your name is: Apeksha')).toBeInTheDocument();
});
