import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import DebugCounter from './DebugCounter';

test('increments by 2 on single click', () => {
  render(<DebugCounter />);
  const btn = screen.getByRole('button');

  expect(btn).toHaveTextContent('Clicked 0 times');
  fireEvent.click(btn);
  expect(btn).toHaveTextContent('Clicked 2 times');
});
