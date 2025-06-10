// UserList.test.js
import React from 'react';
import { render, screen } from '@testing-library/react';
import UserList from './UserList';

beforeEach(() => {
  global.fetch = jest.fn(() =>
    Promise.resolve({
      json: () => Promise.resolve([
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
      ])
    })
  );
});

test('fetches and displays users', async () => {
  render(<UserList />);
  expect(screen.getByText(/Loading/i)).toBeInTheDocument();

  const items = await screen.findAllByRole('listitem');
  const names = items.map(li => li.textContent);
  expect(names).toEqual(expect.arrayContaining(['Alice', 'Bob']));
});
