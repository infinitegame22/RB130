# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    if item.is_a?(Todo)
      todos.push(item)
    else
      raise TypeError.new "Can only add Todo objects"
    end
  end

  alias :<< :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? {|item| item.done? }
  end

  def item_at(index)
    if todos[index]
      todos[index]
    else
      raise IndexError
    end
  end

  def mark_done_at(index)
    if todos[index]
      todos[index].done!
    else
      raise IndexError
    end
  end

  def mark_undone_at(index)
    if todos[index]
      todos[index].done = false
    else
      raise IndexError
    end
  end

  def done!
    todos.each do |item|
      item.done!
    end
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    if todos[index]
      todos.delete_at(index)
    else
      raise IndexError
    end
  end

  # def to_s
  #   puts "---- Today's Todos ----"
  #   todos.each do |item|
  #     if item.done?
  #       p "[X] #{item.title}"
  #     else
  #       p "[ ] #{item.title}"
  #     end
  #   end
  # end

  # LS

  def to_s
    text = "---#{title}---\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
  end

  def select
    todos.each_with_object([]) do |todo, results|
      if yield(todo)
        results << todo
      end
    end
  end

  def find_by_title(string)
    todos.find {|todo| string == todo.title }
  end

  def all_done
    done = TodoList.new("Done")
    done.todos = todos.select {|todo| todo.done? }
    done
  end

  def all_not_done
    not_done = TodoList.new("NotDone")
    not_done.todos = todos.select {|todo| !todo.done? }
    not_done
  end

  def mark_done(string)
    todos.each do |todo|
      if todo.title == string
        return todo.done!
      end
    end
  end

  def mark_all_done
    todos.each { |todo| todo.done! }
  end

  def mark_all_undone
    todos.each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
# todo4 = Todo.new("Buy milk")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
# list.add(todo4)

# todo3.done!
p list.mark_done("Buy milk")
list.mark_all_done
p list.todos
list.mark_all_undone
p list.todos
# list.all_not_done
# list.find_by_title("Buy milk")
# list.find_by_title("Ride bike")