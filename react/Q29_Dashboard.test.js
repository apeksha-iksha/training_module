import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import Dashboard from './Dashboard';

// Mock the AdminPanel dynamic import
jest.mock('./AdminPanel', () => () => <div>Admin Content</div>);

test('lazy-loads AdminPanel on demand', async () => {
  render(<Dashboard user={{ name: 'Jane', isAdmin: true }} />);

  // Initially button is present, panel not shown
  expect(screen.getByText('Open Admin Panel')).toBeInTheDocument();
  expect(screen.queryByText('Loading admin...')).toBeNull();
  expect(screen.queryByText('Admin Content')).toBeNull();

  // Click to load admin panel
  fireEvent.click(screen.getByText('Open Admin Panel'));

  // Should show fallback while loading
  expect(screen.getByText('Loading admin...')).toBeInTheDocument();

  // After dynamic import resolves, Admin Content appears
  await waitFor(() => expect(screen.getByText('Admin Content')).toBeInTheDocument());
});
