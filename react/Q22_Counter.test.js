import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

test('increments counter on button click', () => {
  render(<Counter />);
  const valueElem = screen.getByTestId('count-value');
  expect(valueElem).toHaveTextContent('Count: 0');

  fireEvent.click(screen.getByText('Increment'));
  expect(valueElem).toHaveTextContent('Count: 1');
});
