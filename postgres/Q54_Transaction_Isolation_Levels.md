ACID Properties in PostgreSQL

PostgreSQL is a fully ACID-compliant database system:

1. Atomicity
- Transactions are all-or-nothing
- If any part of a transaction fails, the entire transaction is rolled back
- PostgreSQL ensures this through its transaction management system
- Example: If a money transfer fails halfway, no partial updates occur

2. Consistency
- Every transaction takes the database from one valid state to another
- Enforced through:
  - Database constraints (foreign keys, unique constraints, checks)
  - Triggers
  - User-defined rules
  - Write-Ahead Logging (WAL)

3. Isolation
PostgreSQL supports multiple isolation levels to handle concurrent transactions:

a) Read Uncommitted
- In PostgreSQL, this behaves exactly like Read Committed
- PostgreSQL never allows dirty reads, so there's no true "Read Uncommitted" level
- This is a design choice for data integrity

b) Read Committed (Default)
- Each query sees only data committed before the query began
- Prevents:
  - Dirty reads (seeing uncommitted changes)
- Allows:
  - Non-repeatable reads (same query might return different results in same transaction)
  - Phantom reads (new rows appearing in repeated queries)
- Example of Non-repeatable Read:
  ```sql
  -- Transaction 1
  BEGIN;
  SELECT balance FROM accounts WHERE id = 1;  -- Shows $1000
  -- Meanwhile, Transaction 2 updates and commits
  SELECT balance FROM accounts WHERE id = 1;  -- Now shows $800
  COMMIT;
  ```

c) Repeatable Read
- Transaction sees a snapshot of the database as of transaction start
- Prevents:
  - Dirty reads
  - Non-repeatable reads
  - Phantom reads (in PostgreSQL's implementation)
- Allows:
  - Write skew anomalies (due to snapshot isolation)
- Example of Prevention:
  ```sql
  -- Transaction 1 (Repeatable Read)
  BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
  SELECT balance FROM accounts WHERE id = 1;  -- Shows $1000
  -- Even if Transaction 2 updates and commits, second query shows same result
  SELECT balance FROM accounts WHERE id = 1;  -- Still shows $1000
  COMMIT;
  ```

d) Serializable
- Strongest isolation level
- Transactions behave as if executed sequentially
- Prevents all anomalies:
  - Dirty reads
  - Non-repeatable reads
  - Phantom reads
  - Write skew anomalies
- May abort transactions with SerializationFailure if conflicts detected
- Example:
  ```sql
  -- Two transactions trying to modify related data
  -- One will be aborted if serialization conflict detected
  BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  -- ... operations ...
  COMMIT;  -- Might raise SerializationFailure
  ```

4. Durability
- Once a transaction is committed, it's permanent
- Ensured through:
  - Write-Ahead Logging (WAL)
  - Physical replication (optional)
  - Synchronous commit options

Common Phenomena and Prevention

| Phenomenon | Read Committed | Repeatable Read | Serializable |
|------------|---------------|-----------------|--------------|
| Dirty Reads | Prevented | Prevented | Prevented |
| Non-repeatable Reads | Possible | Prevented | Prevented |
| Phantom Reads | Possible | Prevented | Prevented |
| Write Skew | Possible | Possible | Prevented |

Best Practices
1. Use Read Committed (default) for general operations
2. Use Repeatable Read when consistent snapshot is needed
3. Use Serializable for complex transactions requiring strict isolation
4. Always handle serialization failures in application code
5. Consider performance trade-offs with higher isolation levels

Implementation Details
- PostgreSQL uses Multi-Version Concurrency Control (MVCC)
- Each transaction sees a snapshot of data
- No reader-writer locks for most operations
- Write-Ahead Logging ensures durability
- Predicate locking in Serializable mode prevents anomalies
