require_relative 'linkedlist.rb'
require_relative 'node.rb'

list = LinkedList.new

p "appending some nodes:"

list.append("node appended first")
list.append("node appended second")
list.append("node appended third")

# p list.to_s

p "prepending some nodes:"

list.prepend("node prepended first")
list.prepend("node prepended second")
list.prepend("node prepended third")

# p list.to_s

p "popping a node:"

list.pop

p list.to_s

p "List value at index 1: #{list.at(1).value}"
p "List value at index 5: #{list.at(5).value}"

p list.to_s

p "Appending two nodes with the same value:"

list.append("redundant")
list.append("redundant")

p list.to_s

# p list.contains?("redundant")
# p list.contains?("value we don't contain")
# p list.find("redundant")

p "Inserting a node:"

list.insert_at("Inserted value", 3)

p list.to_s

p "Removing a node:"

list.remove_at(4)

p list.to_s

p "Head: #{list.head.value}"
p "Tail: #{list.tail.value}"