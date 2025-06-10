import React, { useState, lazy, Suspense } from 'react';

const AdminPanel = lazy(() => import('./AdminPanel'));

function Dashboard({ user }) {
  const [showAdmin, setShowAdmin] = useState(false);

  return (
    <div>
      <h1>Welcome, {user.name}</h1>
      {user.isAdmin && (
        <button onClick={() => setShowAdmin(true)}>
          Open Admin Panel
        </button>
      )}
      {showAdmin && (
        <Suspense fallback={<div>Loading admin...</div>}>
          <AdminPanel />
        </Suspense>
      )}
    </div>
  );
}

export default Dashboard;
