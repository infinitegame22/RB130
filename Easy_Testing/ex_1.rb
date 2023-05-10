=begin
Write a minitest assertion that will fail if the value.odd? is not true=
=end
require 'minitest/autorun'
value = 1
assert_equal true, value.odd?