# frozen_string_literal: true

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      prev_value = @head
      @head = Node.new(value, prev_value)
    end
  end

  def pop
    if @head.nil?
      p 'List is Empty'
    else
      current_node = head
      current_node = current_node.next_node until current_node.next_node.next_node.nil?
      last_node = current_node.next_node
      current_node.next_node = nil
    end
    last_node
  end

  def size
    return puts 'The List size is Zero' if @head.nil?

    i = 0
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
      i += 1
    end
    i
  end

  def contains?(value)
    search = @head

    until search.nil?
      return true if search.value == value

      search = search.next_node
    end
    false
  end

  def to_s
    return nil if @head.nil?

    current_node = @head
    string = ''
    until current_node.nil?
      string = "#{string}( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    puts "#{string}empty node"
  end

  def to_a
    arr = []
    return arr if @head.nil?

    current_node = @head
    until current_node.nil?
      arr << current_node.value
      current_node = current_node.next_node
    end
    arr
  end

  def at(idx)
    return 'No match' if idx > to_a.length

    search = @head
    i = 0
    until i == idx
      if search.nil?
        p 'NIL'
      end
      search = search.next_node
      i += 1
    end
    search.value
  end

  def find(value)
    search = @head
    i = 0
    exist = false
    until search.nil?
      exist = true if search.value == value
      search = search.next_node

      i += 1 unless exist == true
    end
    return i if exist == true
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

li = LinkedList.new

li.prepend(30)
li.append(1)
li.append(2)
li.prepend(10)
li.append(3)
li.append(4)
li.append(5)
li.append('bob')
li.prepend('john')
li.prepend(1.1)
li.append(%w[1 2 3 4])

p li.head.value
p li.head.next_node.value
p li.find(4)
p li.size
li.to_s
li.to_a
li.pop
p li.to_a

p li.at(10)
