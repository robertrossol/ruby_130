require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 37
  end

  def test_accept_money
    # cash_register = CashRegister.new(100)
    # transaction = Transaction.new(25)
    @transaction.amount_paid = 25

    previous_total = @register.total_money
    @register.accept_money(@transaction)
    new_total = @register.total_money
    assert_equal previous_total + 25, new_total # assert_equal(previous_total + 37, new_total)
  end

  def test_change
    assert_equal 12, @register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $25.\n", nil) { @register.give_receipt(@transaction) }
  end

end