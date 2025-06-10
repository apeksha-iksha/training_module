import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import { ThemeProvider } from './ThemeContext';
import ThemedButton from './ThemedButton';

test('toggles theme using context', () => {
  render(
    <ThemeProvider>
      <ThemedButton />
    </ThemeProvider>
  );

  const btn = screen.getByRole('button', { name: /Current theme: light/i });
  expect(btn).toHaveTextContent('Current theme: light');

  fireEvent.click(btn);
  expect(btn).toHaveTextContent('Current theme: dark');
});
