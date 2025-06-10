Example 1: Identifying Sequential Scan Issues

```sql
EXPLAIN ANALYZE
SELECT * FROM posts WHERE status = 'active';
Output:
Seq Scan on posts  (cost=0.00..35.50 rows=150 width=72)
  Filter: (status = 'active')
  Rows Removed by Filter: 850
```

Analysis:
1. `Seq Scan` indicates a full table scan
2. Database is reading ALL rows (1000 total)
3. Filtering out 850 non-matching rows
4. Inefficient for large tables

Improvement:
```sql
CREATE INDEX idx_posts_status ON posts(status);

-- After index creation, new EXPLAIN output:
Index Scan using idx_posts_status on posts  (cost=0.28..8.29 rows=150 width=72)
  Index Cond: (status = 'active')
```

Result:
- Cost reduced from 35.50 to 8.29
- No more filtering needed
- Directly accessing matching rows
Example 2: Understanding EXPLAIN Output Components

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM users WHERE email = 'user@example.com';
```

Key Elements to Check:
1. Scan Type:
   - `Seq Scan`: Full table scan (slow for large tables)
   - `Index Scan`: Using index to find rows
   - `Index Only Scan`: Can get all data from index

2. Cost Metrics:
   - `cost=0.00..35.50`: Startup cost..Total cost
   - `rows=150`: Estimated rows to be returned
   - `width=72`: Average row width in bytes

3. Actual Statistics (with ANALYZE):
   - `actual time=0.016..0.019`
   - `actual rows=150`
   - `loops=1`
Common Performance Issues and Solutions

1. Sequential Scan When Filter Exists:
   ```sql
   -- Problem:
   Seq Scan on orders  (cost=0.00..155.00 rows=100 width=40)
     Filter: (status = 'pending')
   
   -- Solution:
   CREATE INDEX idx_orders_status ON orders(status);
   ```

2. High Filter Row Removal:
   ```sql
   -- Problem: Many rows being filtered out
   Seq Scan on users
     Filter: (last_login > '2023-01-01')
     Rows Removed by Filter: 9850
   
   -- Solution:
   CREATE INDEX idx_users_last_login ON users(last_login);
   ```
Best Practices for Plan Analysis

1. Always Check Scan Type:
   - Sequential scans on large tables = red flag
   - Index scans generally better for selective queries

2. Look at Row Estimates:
   - Large differences between estimated and actual rows indicate statistics issues
   - Consider running ANALYZE on table

3. Consider Index Types:
   - B-tree for equality and range queries
   - GiST for geometric or full-text search
   - Hash for equality-only comparisons

4. Watch for:
   - High startup costs
   - Large numbers of rows being filtered
   - Multiple sequential scans in joins 