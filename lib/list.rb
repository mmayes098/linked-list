require_relative "node"

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    current = Node.new(value)
    if @head.nil?
      @head = current
      @tail = current
    else
      @tail.next_node = current
      @tail = current
    end
  end

  def prepend(value)
    current = Node.new(value)
    if @head.nil?
      @head = current
      @tail = current
    else
      current.next_node = @head
      @head = current
    end
  end

  def size
    count = 0
    pointer = @head
    return 0 if @head.nil?
    return 1 if @head == @tail
    until pointer.nil?
      count += 1
      pointer = pointer.next_node
    end

    count
  end

  def at(index)
    count = 0
    pointer = @head
    return nil if index > size - 1

    until pointer.nil?
      return pointer.value if count == index
      count += 1
      pointer = pointer.next_node
    end
  end

  def pop
    return puts "Can't delete, no items in the list!" if @head.nil?

    if size == 1
      @head = nil
      @tail = nil
      return
    end

    pointer = @head
    pointer = pointer.next_node until pointer.next_node == @tail
    pointer.next_node = nil
    @tail = pointer
  end

  def contains?(value)
    pointer = @head
    until pointer.nil?
      return true if pointer.value == value
      pointer = pointer.next_node
    end

    false
  end

  def find(value)
    count = 0
    pointer = @head
    until pointer.nil?
      return count if pointer.value == value
      count += 1
      pointer = pointer.next_node
    end
  end

  def to_s
    string = ''
    count = 0
    pointer = @head
    until pointer.nil?
      string << "( #{pointer.value} ) -> "
      count += 1
      pointer = pointer.next_node
    end
    string << 'nil'
    puts string
  end
end