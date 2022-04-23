# frozen_string_literal: true

class LinkedList
  attr_accessor :head

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

  def at(idx)
    return 'No match' if idx > to_a.size

    search = @head
    i = 0
    until i == idx
      search = search.next_node
      i += 1
    end
    if search.nil?
      'No match'
    else
      search
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

  def contains?(value)
    search = @head

    until search.nil?
      return true if search.value == value

      search = search.next_node
    end
    false
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
    return "The value #{value} is on index #{i}" if exist == true
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

  #  Extra credit

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

  def insert_at(value, index)
    return puts 'Out of range' if index > to_a.size || index.negative?

    if index.zero?
      prepend(value)
    elsif index == to_a.size
      append(value)
    else
      next_node = at(index)
      prev_node = at(index - 1)
      new_node = Node.new(value)
      prev_node.next_node = new_node
      new_node.next_node = next_node
    end
  end

  def remove_at(index)
    return puts 'Out of range' if to_a.size - 1 < index

    if index.zero?
      @head = @head.next_node
    else
      at(index - 1).next_node = at(index - 1).next_node.next_node
    end
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

li.append(1)
li.append(2)
li.append(3)
li.append(4)
li.append(5)
li.append(6)
li.append(7)
li.prepend('bubina')

li.at(0)
li.to_s
p li.to_a
li.pop
li.insert_at(99, 3)
p li.to_a
p li.find('bubina')
li.remove_at(3)
p li.to_a
