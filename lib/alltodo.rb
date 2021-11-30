# frozen_string_literal: true

require_relative "alltodo/version"

module Alltodo
  class Error < StandardError; end
  # Your code goes here...
  class MdFormatter
    def run(text)
      "- [ ] #{text}"
    end
  end

  class StackTodo
    def add(text)
      File.open('stack.md', 'a') { |f| f << text }
    end
  end
end
