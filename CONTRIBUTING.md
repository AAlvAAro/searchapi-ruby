# Contributing to searchapi-ruby

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to this project.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for everyone.

## Getting Started

### Prerequisites

- Ruby >= 3.0
- Bundler

### Setup

1. Fork and clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/searchapi-ruby.git
cd searchapi-ruby
```

2. Install dependencies:

```bash
bundle install
```

3. Run the test suite to verify everything works:

```bash
bundle exec rspec
```

## Development Workflow

### Branch Naming

Use descriptive branch names:

- `feature/add-new-engine` for new features
- `fix/client-timeout-handling` for bug fixes
- `docs/update-readme` for documentation changes

### Making Changes

1. Create a new branch from `main`:

```bash
git checkout -b feature/your-feature-name
```

2. Make your changes, following the coding conventions below.

3. Add or update tests as needed.

4. Run the full test suite:

```bash
bundle exec rspec
```

5. Commit your changes with a clear message:

```bash
git commit -m "Add support for new_engine API"
```

6. Push to your fork and open a Pull Request.

## Coding Conventions

### Style

- Use `frozen_string_literal: true` in all Ruby files
- Follow standard Ruby naming conventions (snake_case for methods, CamelCase for classes)
- Keep methods short and focused
- Use keyword arguments for required non-query parameters

### Adding a New Engine Resource

All engines follow the same pattern. To add a new engine:

1. Create the resource file in `lib/searchapi/resources/`:

```ruby
# frozen_string_literal: true

module SearchApi
  module Resources
    class NewEngine < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "new_engine"
      end
    end
  end
end
```

2. Register it in `lib/searchapi.rb`:
   - Add the `require_relative` statement
   - Add the entry to the `RESOURCES` hash

3. Add tests in `spec/searchapi/resources/new_engine_spec.rb`:

```ruby
# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::NewEngine do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "searches with the correct engine" do
      expect(client).to receive(:get).with("/search", {
        engine: "new_engine",
        q: "test query"
      })

      resource.search("test query")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "new_engine",
        q: "test query",
        page: 2
      })

      resource.search("test query", page: 2)
    end
  end
end
```

4. Update the README with usage examples.

5. Add an entry to CHANGELOG.md.

### Testing

- All tests use RSpec with `instance_double` for mocking the client
- Tests should verify the correct engine name and parameter mapping
- Use realistic, descriptive test values
- Run the full suite before submitting:

```bash
bundle exec rspec
```

## Pull Request Guidelines

- Keep PRs focused on a single change
- Include tests for any new functionality
- Update documentation if needed
- Reference any related issues in the PR description
- Ensure all tests pass before requesting review

## Reporting Issues

When reporting bugs, please include:

- Ruby version (`ruby -v`)
- Gem version
- Steps to reproduce
- Expected vs. actual behavior
- Any relevant error messages or stack traces

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE.txt).
