require 'minitest/autorun'
require 'io/console'
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test

  def test_promp_for_payment
    transaction = Transaction.new(25)
    # transaction.amount_paid = 37
    input = StringIO.new("45/n")
    output = StringIO.new

    transaction.prompt_for_payment(input: input, output: output)
    # system "clear"
    $stdout.clear_screen
    assert_equal 45, transaction.amount_paid
  end


  # def prompt_for_payment(input: $stdin)
  #   loop do
  #     puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
  #     break if valid_payment? && sufficient_payment?
  #     puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #   end
  # end

end