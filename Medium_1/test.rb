text = %q{ 
This is a test of 
paragraph one. 

This is a test of 
paragraph two. 

This is a test of 
paragraph three. 
} 
p text
paragraph_count = text.split(/\n\n/).length #3
puts "#{paragraph_count} paragraphs"

# http://www.java2s.com/example/ruby-book/counting-sentences-and-paragraphs-in-text-file.html

=begin
Start with the `#process` method; we told you that `#process` should read some text from a file, and then 
pass that text to the block for further processing. The usual approach for such read-and-process code looks like this:

=end

file = File.open('sample_text.txt', 'r')
# do processing here
file.close

=begin

File's parent is IO

Remember to always close files when you finish using them.

Since we're supposed to pass the text content of the file to the block, we must
load the file's content and call the block, which we do with `yield(file.read)`:


=end