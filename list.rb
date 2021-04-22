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
end

class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @next_node = nil
    @value = value
  end
end