# Other ideas:
# Create index whenever you create a node -- makes index lookups easier
  # On the other hand, lookups might get slower, since you have to change the index
  # for lots of nodes whenever you insert anything

class LinkedList

  attr_accessor :head
  attr_accessor :tail
  attr_accessor :size

  def initialize
    @head = Node.new("head")
    @size = 1
  end

  def append(value)
    self.tail.next_node = Node.new(value, nil)
    @size += 1
  end

  def prepend(value)
    old_head = @head
    @head = Node.new(value, old_head)
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    if @head.next_node != nil
      node = @head.next_node
      while node.next_node != nil
        node = node.next_node
      end
      node
    else
      @head
    end
  end

  def at(index)
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    pop_value = self.tail
    self.tail = nil
    self.at(@size - 2).next_node = nil
    puts pop_value.value
    @size -= 1
  end

  def contains?(value)
    ObjectSpace.each_object(Node) do |object|
      return true if object.instance_variable_get(:@value) == value
    end
    false
  end

  def find(value)
    found = false
    index = 0
    node = @head
    until node.next_node == nil
      if node.value == value
        puts "Index = #{index}"
        found = true
      end
      index += 1
      # This way of going about things returns an extra "nil", somewhat annoying
      node = node.next_node
    end
    return "Value not found!" unless found == true
  end

  def to_s
    node = @head
    @size.times do
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    # For some reason, printing "nil" gets us "nilnil", check on that
    print ""
  end

  def insert_at(value, index)
    node = @head
    index.times do
      node = node.next_node
    end    
    new_node = Node.new(value, self.at(index + 1))
    node.next_node = new_node
    @size += 1
  end

  def remove_at(index)
    self.at(index - 1).next_node = self.at(index + 1)
    node = @head.next_node
    index.times do
      node = node.next_node
    end
    node = nil
    @size -= 1
  end

end
