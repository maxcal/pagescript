# Development
Developing this gem should be a pretty straight forward "bundle and go"
experience.

You will need experience with Rails, RSpec and jQuery.

## Getting started
`bundle`, optionally start `bin/guard` for continuous integration.

You can run the dummy app rails server for prototyping or debugging:

```bash
spec/dummy/bin/rails s
```

## Document
Document any public methods introduced.
Run `yard server --reload` and check that the generated documentation is
neat and readable. API documentation is preferable to line comments.

## Test
Start with a failing spec and work from there. PR's that introduce features
without a spec will not be merged.
