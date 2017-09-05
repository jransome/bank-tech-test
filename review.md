## RESULT: MORE WORK TO DO

Good 1st draft. Doesn't pass Acceptance Criteria
User should see this:
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

- (I am saying this to everyone) Seriously, please read all of this: https://github.com/makersacademy/jobhunters/blob/master/pills/tech_test_guide.md

### LIB
- NICE: the direction to go down in terms of logging a transaction.
- what are the responsibilities of Account? Can this be broken down?
- think harder about single responsibilities. Each method, each class.

### SPECS
- NICE: removed comments from spec_helper, but left SimpleCov comments in?
- NICE: readable spec format
- Time.now.to_s, how can you avoid this?

### README.md
- instructions: how would I actually set your app up?
 - bundle install, how do i run tests, what are the return values meant to be when i use it in irb?

### STYLE
- NICE: code looks easy to read
- NICE: COVERAGE: 100.00% -- 59/59 lines in 4 files

### OTHER
- remove pry from gemfile, it's a debugger
