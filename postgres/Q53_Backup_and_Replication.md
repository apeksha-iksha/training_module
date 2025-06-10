1. Backup Strategies

Logical Backups (pg_dump)
```bash
Full database backup in custom format
pg_dump -Fc mydatabase > backup.dump

Restore using pg_restore
pg_restore -d mydatabase backup.dump
```

Benefits:
- Human-readable (if using plain SQL format)
- Can selectively restore specific tables/schemas
- Version compatibility across PostgreSQL releases

Limitations:
- Takes longer than physical backups
- No point-in-time recovery capability

Physical Backups (Continuous Archiving)
1. Base Backup:
```bash
pg_basebackup -D /backup/path -Fp -Xs -P
```

2. Configure WAL Archiving in postgresql.conf:
```
wal_level = replica
archive_mode = on
archive_command = 'cp %p /archive/%f'  Copy WAL files to archive
```

Benefits:
- Point-in-Time Recovery (PITR) capability
- Faster than logical backups
- Continuous backup of changes

2. Replication Setup

Streaming Replication Configuration

1. On Primary Server (postgresql.conf):
```
wal_level = replica
max_wal_senders = 3
listen_addresses = ''
```

2. Create Replication User:
```sql
CREATE ROLE repluser WITH REPLICATION LOGIN PASSWORD 'secretpass';
```

3. Configure Access (pg_hba.conf):
```
host replication repluser standby_ip/32 md5
```

4. Initialize Standby:
```bash
Take base backup for standby
pg_basebackup -h primary_host -D /standby_data -U repluser -P
```

5. Create standby.signal on Standby (PostgreSQL 12+):
```
Empty file indicates this is a standby
touch /standby_data/standby.signal
```

Key Points to Remember:
1. Backup Best Practices:
   - Store backups offsite
   - Test restores regularly
   - Automate backup processes
   - Keep backup retention policy

2. Replication Considerations:
   - Replication is NOT a backup solution
   - Deletions/corruptions on primary replicate to standby
   - Standby is read-only by default
   - Useful for:
     - Read scaling
     - High availability
     - Disaster recovery

3. Common Gotchas:
   - Always verify backups by testing restores
   - Monitor replication lag
   - Ensure sufficient disk space for WAL archives
   - Plan for failover scenarios

Summary
A robust PostgreSQL backup strategy combines:
- Regular full backups (pg_dump)
- Continuous WAL archiving for PITR
- Replication for high availability
- Regular backup testing
- Offsite backup storage 
