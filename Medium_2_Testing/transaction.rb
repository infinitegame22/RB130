# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  # def prompt_for_payment
  #   loop do
  #     puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     @amount_paid = gets.chomp.to_f
  #     break if valid_payment? && sufficient_payment?
  #     puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #   end
  # end

  def prompt_for_payment(input: $stdin, output: $stdout)
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

# input = StringIO.new("30\n")
# transaction.prompt_for_payment(input: input)

# LS explanation

=begin
With the description above, this code isn't too difficult to understand.
The test first creates a new transaction for an item whose cose is $30. 
We then create a `StringIO` object that simulates a keyboard entry of the number
`30` followed by a newline character. Next, we pass the `StringIO` object to
the `prompt_for_payment` method.

Since `prompt_for_payment` will get its input from the `StringIO` object, it
will act exactly like it would have were we using the keyboard directly. In this 
case it will set the amount paid to $30 and return. Finally, we can assert that
  the right amount was paid.
end

=end