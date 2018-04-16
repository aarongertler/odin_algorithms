class Node

  attr_accessor :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end