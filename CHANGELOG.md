# Changelog

## 0.0.6 (2025-12-15)

- Added 84codes RuboCop rules ([#21](https://github.com/84codes/rubocop-eightyfourcodes/pull/21))

## 0.0.5 (2025-05-07)

- Handled deprecation of `EnsureNode#body` ([#20](https://github.com/84codes/rubocop-eighty-four-codes/pull/20))

## 0.0.4 (2025-03-20)

- Imported `rubocop-gitlab-security` cops ([#12](https://github.com/84codes/rubocop-eighty-four-codes/pull/12))

## 0.0.3 (2024-10-23)

- Recreated entire project using <https://github.com/rubocop/rubocop-extension-generator>
- Added `EnsureRedirect`

## 0.0.2 (2020-09-24)

- Added `RubyVersionFile`: Ensure we read Gemfile ruby version from `.ruby-version` file

## 0.0.1 (2019-09-11)

- Forked from gitlab-security
- Added `CommandLiteralInjection`: Passing user input to `` and %x without sanitization and parameterization can result in command injection)
