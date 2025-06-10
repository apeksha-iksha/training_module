import React from 'react';
import { render, screen } from '@testing-library/react';
import Greeting from './Greeting';

test('displays greeting with the provided name', () => {
  render(<Greeting name="Alice" />);
  expect(screen.getByText('Hello, Alice!')).toBeInTheDocument();
});