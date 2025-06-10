import React from 'react';
import { render, screen } from '@testing-library/react';
import ExpensiveCalculator from './ExpensiveCalculator';

test('memoizes expensive computation', () => {
  const computeFn = jest.fn(n => n * 2);

  const { rerender } = render(
    <ExpensiveCalculator num={5} computeFn={computeFn} />
  );

  // First render: computeFn should be called once
  expect(screen.getByTestId('result').textContent).toBe('10');
  expect(computeFn).toHaveBeenCalledTimes(1);

  // Re-render with same props: computeFn should NOT be called again
  rerender(<ExpensiveCalculator num={5} computeFn={computeFn} />);
  expect(screen.getByTestId('result').textContent).toBe('10');
  expect(computeFn).toHaveBeenCalledTimes(1);

  // Re-render with different num: computeFn should be called again
  rerender(<ExpensiveCalculator num={6} computeFn={computeFn} />);
  expect(screen.getByTestId('result').textContent).toBe('12');
  expect(computeFn).toHaveBeenCalledTimes(2);
});
