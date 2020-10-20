class LinkedList

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head == nil && @tail == nil
      @tail = Node.new(value)
      @head = @tail
    else
      new_node = Node.new(value)
      @tail.next_node = new_node unless @tail == nil
      @tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    if @head == nil && @tail == nil
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value,@head)
    end
    @size += 1
  end

  def size
    return @size
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    current_node = @head
    i = 0
    while i<index 
      current_node = current_node.next_node
      i += 1
    end
    return current_node
  end

  def pop
    current_node = @head
    while current_node.next_node != @tail
      current_node = current_node.next_node
    end
    @tail = current_node
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    current_node = @head
    while current_node != nil
      if value == current_node.value
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end

  def find(value)
    current_node = @head
    while current_node != nil
      if value == current_node.value
        return current_node
      end
      current_node = current_node.next_node
    end
    return nil
  end

  def to_s
    current_node = @head
    while current_node != nil
      if current_node.next_node != nil
        print "( #{current_node.value} ) -> "
      else
        print "( #{current_node.value} )"
      end
      current_node = current_node.next_node
    end
    return ""
  end

  def insert_at(value,index)
    if index == 0
      self.prepend(value)
    elsif index == @size
      self.append(value)
    elsif index > @size
      raise "Index out of range"
    else
      current_node = @head
      for i in 1...index
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value,current_node.next_node)
      @size += 1
    end
  end

  def remove_at(index)
    if  index == 0
      @head = @head.next_node
      @size -= 1
    elsif index == @size-1
      self.pop
    elsif index >= @size
      raise "Index out of range"
    else
      current_node = @head
      for i in 1...index
        current_node = current_node.next_node
      end
      current_node.next_node = current_node.next_node.next_node
      @size -= 1
    end
  end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    return "(Value: #{@value})"
  end

end


list = LinkedList.new
list.prepend("a")
list.append("b")
list.append("c")
list.append("d")
list.append("e")
list.append("f")
list.append("g")
list.append("h")
list.append("i")
list.append("j")
list.append("k")