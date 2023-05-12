require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end

  def test_give_receipt
    assert_nil @register.give_receipt(@transaction)
  end
end

# LS

# class CashRegisterTest < Minitest::Test
  # def test_give_receipt
    # item_cost = 35
    # register = CashRegister.new(1000)
    # transaction = Transaction.new(item_cost)
    # assert_output("You've paid $#{item_cost}.\n") do
      # register.give_receipt(transaction)
    # end
  # end
# end
=begin
For this test, we'll be testing that our method outputs a certain message.
To test this, we need to use the assertion, `assert_output`. Outputting a 
message is also considered a side effect, so it is something we would want 
to test. This is especially true since our message *should* reflect a state 
of our current transaction. `assert_output` uses a slightly different syntax
than something like `asssert` and `assert_equal`. We pass in code that will 
produce the "actual" output via a block. Then, internally `assert_output` compares
that output to the expected value passed in as an arugment. In this case that 
expected value is: "You've paid $#{item_cost}.\n"
Nptice that we include a newline character at the end there. Any little nuances
related to the implementtation of our method have to be taken into account. 
`puts` appends a new line to the message that is output .  We must include that 
newline character in our expected value as well when making an assertion with 
`assert_output`.
=end