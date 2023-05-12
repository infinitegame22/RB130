require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(80)
    transaction.amount_paid = 150
    # register.accept_money(transaction)
    change = register.change(transaction)
    assert_equal 70, change
  end
end

# Arnot

class TestCashRegister < MiniTest::Test
  def setup 
    @register = CashRegister.new(500)
    @transaction = Transaction.new(95)
  end

  def test_change
    @transaction.amount_paid = 100
    assert_equal(5, @register.change(@transaction))
  end
end

