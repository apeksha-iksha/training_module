Key Principles for Choosing Data Types

1. Monetary Values (Most Critical)
```sql
-- CORRECT: Using NUMERIC for monetary values
price NUMERIC(10, 2)  -- Stores exact values like 123.45

-- WRONG: Using FLOAT for money
price FLOAT  -- Can cause rounding errors
```

**Why NUMERIC over FLOAT?**
- FLOAT can introduce rounding errors (e.g., 0.1 + 0.2 = 0.30000000000000004)
- NUMERIC guarantees exact decimal arithmetic
- Critical for financial calculations where every cent matters

Example demonstrating the difference:
```sql
SELECT 0.1::float + 0.2::float;  -- Might return 0.30000000000000004
SELECT 0.1::numeric + 0.2::numeric;  -- Exactly 0.3
```

2. Date and Time Data
```sql
-- CORRECT: Using proper date types
created_at TIMESTAMPTZ  -- Includes timezone
birth_date DATE         -- Just the date

-- WRONG: Using strings for dates
created_at VARCHAR(50)  -- Loses date validation and arithmetic
```

Benefits:
- Automatic validation (no "February 30th")
- Easy date arithmetic
- Proper timezone handling

3. Text Storage
```sql
-- CORRECT: Using TEXT or VARCHAR
description TEXT        -- Unlimited length
name VARCHAR(100)      -- When you need length constraint

-- WRONG: Using CHAR(n)
name CHAR(20)          -- Wastes space with padding
```

4. Boolean Values
```sql
-- CORRECT: Using BOOLEAN
is_active BOOLEAN      -- Stores true/false

-- WRONG: Using alternatives
is_active CHAR(1)      -- 'Y'/'N' or '1'/'0'
```

Best Practices Summary
1. Use NUMERIC(precision, scale) for money and precise decimals
2. Use proper DATE/TIME types for temporal data
3. Prefer TEXT or VARCHAR over CHAR
4. Use BOOLEAN for true/false flags
5. Choose types that ensure data integrity and validation

Remember: Choosing the right data type improves:
- Data integrity
- Query performance
- Storage efficiency 
