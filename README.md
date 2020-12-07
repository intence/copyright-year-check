# pre-commit copyright year check
A simple shell script which checks whether a file's copyright header
includes the current year.

Built to be deployed with [pre-commit](https://pre-commit.com/).

## Usage
Add this entry in your `.pre-commit-config`.
```
repos:
  ...
  - repo: git://github.com/intence/copyright-year-check
    rev: 1.0.0
    hooks:
      - id: copyright-year-check
  ...
```

## Known issues
File names containing whitespaces are currently not supported.
