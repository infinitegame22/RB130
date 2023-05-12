require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
     @file = File.open('./sample_text.txt', 'r')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

=begin
For this test we first need to determine the word count of the 
sample text. That can be ascertained easily enough by calling 
the `word_count` method manually, or by reading in the file in irb
and counting the words from there. We then write in that value 
into our test as the expected value. We also need to make sure that
we read the file to gain access to the relevant text. We're able
to call `@file.read` since the opening or our file is handled in
the `setup` method. If we didn't first open that file, then calling
`@file.read` would throw an error. Lastly, we use `assert_equal`
with our hard-coded word count and a call to `text.word_count` as
arguments.

Regarding our `teardown` method, Ruby can be a bit lenient when it
comes to closing files. If we didn't call `@file.close`, then the
`File` object associated with `@file` would be closed when our script
is finished running. This is a failsafe impelemented by the `IO` class.
But it is best to be explicit about these things. Since this is an 
example where we only work with one file, things may turn out ok. But
imagine if we were dealing with several files, we would want to keep 
track of when they are opened and closed. It may not seem all that 
intuitive that our `File` really is closed properly. We could add one
more line of code to our test file to verify that teardown if call after
**each** test. We'll use the predicate method, `closed?` to verify that
we have closed our file.
=end

=end