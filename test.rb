#!/usr/bin/env ruby
require_relative 'greetings-program'


def test_something
  foo = ClassName.new
  x = foo.alchemy("cheese")
  raise x unless x == "cheese"
end


test_something
