# DNSHub
[![Build Status](https://travis-ci.org/DNSHub/DNSHub.png)](https://travis-ci.org/DNSHub/DNSHub)
[![Coverage Status](https://coveralls.io/repos/DNSHub/DNSHub/badge.png)](https://coveralls.io/r/DNSHub/DNSHub)

## Testing
### Troubleshoot
If you have issues like
```
Failure/Error: build(:native_domain)
     ActiveRecord::StatementInvalid:
       Could not find table 'domains'
```
delete the test databases and create new with `rake RAILS_ENV=test db:migrate`
