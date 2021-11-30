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
    attr_reader :path

    def initialize
      @path = 'stack.md'
    end

    def add(text)
      File.open(path, 'a') { |f| f << text }
    end

    def all
      File.read(path)
    end
  end
end
