=begin
testing frameworks and libraries 

assert statements we see across, the languages

GoPeer is in Cambridge, MA.

Spikes in work.  Foundations of SE, project with fake work environment.  Boss is teacher will give deadlines, finish this in this sprint. 
Watch Youtube videos on spikes in agile.

binary tree
n-ary tree
B-tree --> move nodes around and keep nodes even, has time advantage, every time you go down a level, you double the amount of nodes

log base 2, every level has a base of two.  Every time we go down, 2 to the 1, down a level 2 to the 2. 

Trees build the databases.  Hard drives with information written to them.
B-tree gives log n search time, only need to 10 iterations to get to the data.

FIFO is queue.  A stack is like a stack of plates.  LIFO.  Last in first out.  Useful for certain 
They are similar in that htey have rules.
Callstack - plates as functions.  Call 1, then the next.  When the topmost call is done, remove it.  Go to the function next.

This is how recursion works, with a stack.  Calling the same function repeatedly, but changing some input parameter.  When hit the base case, n=1, pulling off the top of the stack until get back to the start.

When you initialize a class, it adds that to the stack, and any subsequent methods called, will keep building on the stack.

https://www.google.com/search?q=memory+layout+of+c+program&client=safari&rls=en&sxsrf=APwXEdcQ-yDWAS7cZmOHmlEtEKRrYga68w:1682267526008&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi46LfytsD-AhWxGTQIHZC4DV0Q0pQJegQIBxAC&biw=640&bih=617&dpr=2#imgrc=KPehyCq66LdKMM

The text at the bottom of the picture is the class defintion.  This rectangle depicts the RAM.  The stack is the portion of the RAM that is used automatically to call it.

HEAP - represents the memory heap or there's a data structure called a heap (type of tree).

In the memory context, the heap is whenever I define a variable that needs to be resizable, have to use heap memory.  

Can dynamically add to a list, need heap memory, which is free memory we can keep building on. 

C program, with a debugger.  YOUTUBE!! Stack overflow
RAM makes the gap between stack and heap larger

Every node is an object.  A tree is an accumulation of nodes and their relationships.   The tree is the sum of its parts.
left or right child at the current depth
a heap is a binary tree in memory, represented with an array using index math.
The whole point of the heap, it maintains the root to be either keeep track of the lowest element.
This happens in o(1), the tree will still have to shift itself around.  The heap is very efficient at maintaining the root.

A leaf is the bottom of the branch, no children.
=end

class Tree
  include Enumerable

  attr_accessor :root_node

  def initialize
    @root_node = nil
  end

  def each
    # every node has the same structure, checklist per node
  end
end

class Node
  attr_accessor :number, :left_child, :right_child

  def initialize(number, left_child=nil, right_child=nil)
    @number = number
    @left_child = left_child
    @right_child = right_child
  end
end

# https://favtutor.com/blogs/tree-traversal-python-with-recursion