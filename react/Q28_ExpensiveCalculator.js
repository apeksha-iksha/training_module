import React, { useMemo } from 'react';

function ExpensiveCalculator({ num, computeFn }) {
  // Memoize the expensive computation so it only re-runs when `num` or `computeFn` change
  const result = useMemo(() => computeFn(num), [num, computeFn]);

  return <span data-testid="result">{result}</span>;
}

export default ExpensiveCalculator;
