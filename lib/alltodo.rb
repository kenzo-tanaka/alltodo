# frozen_string_literal: true

require_relative "alltodo/version"

module Alltodo
  class Error < StandardError; end
  # Your code goes here...
  class MdFormatter
    def add(text)
      "- [ ] #{text}"
    end
  end
end
