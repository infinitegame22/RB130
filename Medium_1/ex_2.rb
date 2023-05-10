=begin
Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

input: text file

Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
sit consequat cupidatat.

Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
aliqua ea sunt ex nisi non.

Officia dolore labore non labore irure nisi ad minim consectetur non irure
veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
commodo.

output: 3 paragraphs
        15 lines
        126 words

=end

# class TextAnalyzer
#   def process
#     # your implementation

#     # output_text = File.open("sample_text.txt")
#     # # lines = File.readlines(""sample_text.txt"")
#     lines = File.readlines("sample_text.txt")
#   end
# end

# LS

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

text = File.read "test.txt"
puts "#{text.split("\n").size} lines."
paragraphs = text.split ".\n"
puts "#{paragraphs.length} paragraphs."

words_in_each_paragraph = paragraphs.map.with_index do |paragraph, i|
    puts "working on paragraph ##{i}"
    paragraph.split("\n").map.with_index do |line, j|
        puts "working on line ##{j}"
        line.scan(/\w+/).tap &method(:p)
    end
end

p words_in_each_paragraph[1]

# https://codereview.stackexchange.com/questions/37696/splitting-a-text-file-into-paragraphs-and-words

=begin
text = File.read "test.txt"
puts "#{text.split("\n").size} lines."
paragraphs = text.split ".\n"
puts "#{paragraphs.length} paragraphs."

words_in_each_paragraph = paragraphs.map.with_index do |paragraph, i|
    puts "working on paragraph ##{i}"
    paragraph.split("\n").map.with_index do |line, j|
        puts "working on line ##{j}"
        line.scan(/\w+/).tap &method(:p)
    end
end

p words_in_each_paragraph[1]
i isn't inside File.foreach loop. It was used in previous looping, but not here.
The best practice to create a new array with the same length as another one is to use .map. Anyway try to avoid usage of i in Ruby. You shouldn't bother with indexes.
I assume you wanted to get a three-dimensional array, not the array and some hashes.
Method .tap can be handy for debug printing while processing/converting data. It allows do some post-processing while returning the object itself to keep your .map blocks safe.
Note, I used \n -- you may want to change it back to \r, but usually you don't need to think about line-endings -- \n should be ok everywhere since OS should take care about it.
=end