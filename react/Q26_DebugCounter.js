import React, { useState } from 'react';

function DebugCounter() {
  const [count, setCount] = useState(0);

  const incrementTwice = () => {
    // Use functional update to avoid stale state
    setCount(prev => prev + 1);
    setCount(prev => prev + 1);
  };

  return (
    <button onClick={incrementTwice}>
      Clicked {count} times
    </button>
  );
}

export default DebugCounter;
