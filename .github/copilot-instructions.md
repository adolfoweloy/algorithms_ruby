# GitHub Copilot Instructions

## Project Overview
This is a Ruby algorithms and data structures practice project containing implementations of various coding problems and their corresponding RSpec tests.

## Code Style and Conventions

### Ruby Style
- Use 2 spaces for indentation
- Follow Ruby naming conventions: snake_case for methods and variables, PascalCase for classes
- Use descriptive method and variable names
- Add comments for complex algorithms or non-obvious logic

### Test Structure
- All tests are located in the `spec/` directory
- Test files follow the pattern `*_spec.rb`
- Use RSpec for testing with `describe` and `it` blocks
- Use `let` and `before(:each)` for test setup when appropriate
- Test edge cases and multiple scenarios for each algorithm

### File Organization
- Implementation files go in `lib/` directory
- Each algorithm should have its own file with a descriptive name
- Class names should be descriptive (e.g., `SellStocks`, `Calculator227`)

## Specific Guidelines

### Algorithm Implementations
- Implement each algorithm as a class with a main method (e.g., `max_profit`, `calculate`, `solution`)
- Include time and space complexity comments where helpful
- Handle edge cases (empty inputs, nil values, single elements)
- Use meaningful variable names that describe the algorithm's logic

### Tree Problems
- Use the `TreeNode` class for binary tree problems
- Use the `GenericTreeNode` class for generic tree problems
- Include proper null/nil checks for tree traversals

### Calculator Problems
- Handle operator precedence correctly
- Support basic arithmetic operations (+, -, *, /)
- Handle spaces in input strings
- Return 0 for nil or empty inputs
- Use integer division (truncate towards zero)

### Testing Best Practices
- Test the main functionality with typical inputs
- Include edge cases (empty, nil, single element, negative numbers)
- Use descriptive test names that explain the scenario
- Group related tests in contexts when appropriate
- Test both positive and negative outcomes

## Example Patterns

### Basic Algorithm Class
```ruby
class AlgorithmName
  def main_method(input)
    # Handle edge cases
    return default_value if input.nil? || input.empty?

    # Algorithm implementation
    result = process(input)

    result
  end
end
```

### RSpec Test Structure
```ruby
require_relative "../lib/algorithm_name.rb"
require "rspec"

RSpec.describe AlgorithmName do
  let(:subject) { AlgorithmName.new }

  describe "#main_method" do
    it "handles basic case" do
      expect(subject.main_method(input)).to eq(expected)
    end

    it "handles edge case" do
      expect(subject.main_method(nil)).to eq(default_value)
    end
  end
end
```

## Dependencies
- RSpec for testing
- Pry for debugging (available in Gemfile)
- Ruby environment managed with rbenv

## Running Tests
```bash
bundle exec rspec spec/filename_spec.rb
```
