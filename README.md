# DNSHub

## Testing
### Troubleshoot
If you have issues like
```
Failure/Error: build(:native_domain)
     ActiveRecord::StatementInvalid:
       Could not find table 'domains'
```
delete the test databases and create new with `rake RAILS_ENV=test db:migrate