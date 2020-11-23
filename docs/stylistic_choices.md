## Stylistic choices

### Avoid large jumps in indentation
A personal preference which I believe to be more readable than the RuboCop default.
```yml
Layout/FirstHashElementIndentation:
  EnforcedStyle: consistent
```

### Prefer double quoted strings
A contentious one within the Ruby community! Modern Ruby versions seem to offer no performance advantage to using single quotes (https://www.viget.com/articles/just-use-double-quoted-ruby-strings/). For consistency, I prefer a blanket use of double quotes.
```yml
Style/StringLiterals:
  Enabled: true
  EnforcedStyle: double_quotes
```

### Only comment when necessary
I favour self-documenting code. I only write comments where absolutely necessary and view comments as an indicator of complexity which could probably be refactored.
```yml
Style/Documentation:
  Enabled: false
```

### Use leading underscore for memoized variables
To make it clear that the instance variable should not be called directly.
```yml
Naming/MemoizedInstanceVariableName:
  EnforcedStyleForLeadingUnderscores: required
```
