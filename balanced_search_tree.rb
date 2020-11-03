class Node
  attr_accessor :left, :right, :data
  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  private
  
  def is_leaf?
    if @right == nil && @left == nil
      return true
    else
      return false
    end
  end

  def to_s
    return "(#{@data})"
  end

end

class Tree
  attr_accessor :root
  def initialize(array)
    array.uniq!.sort!
    @root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)
    current_node = @root
    while current_node != nil
      if value > current_node.data
        current_node.right = Node.new(value) unless current_node.right != nil
        current_node = current_node.right
      elsif value < current_node.data
        current_node.left = Node.new(value) unless current_node.left != nil
        current_node = current_node.left
      else
        return "Value already in tree"
      end
    end
  end

  def delete(value, current_node = @root)
    return current_node if current_node == nil
    if value < current_node.data
      current_node.left = delete(value, current_node.left)
    elsif value > current_node.data
    current_node.right = delete(value, current_node.right)
    else
      if (current_node.left == nil)
        temp = current_node.right
        return temp
      elsif (current_node.right == nil)
        temp = current_node.left
        return temp
      end
      temp = find_successor(current_node)
      current_node.data = temp.data
      current_node.right = delete(temp.data, current_node.right)
    end
    return current_node
  end

  def level_order(current_node = @root)
    values = []
    queue = []
    values.push(current_node.data)
    queue.push(current_node.left)
    queue.push(current_node.right)
    while (!(queue.empty?))
      current_node = queue[0]
      queue.shift
      queue.push(current_node.left)
      queue.push(current_node.right)
      queue.compact!
      values.push(current_node.data) unless current_node == nil
    end
    return values
  end

  def inorder(current_node = @root, values = [])
    return nil if current_node == nil
    inorder(current_node.left, values)
    values.push(current_node.data)
    inorder(current_node.right, values)
    return values
  end

  def preorder(current_node = @root, values = [])
    return nil if current_node == nil
    values.push(current_node.data)
    preorder(current_node.left, values)
    preorder(current_node.right, values)
    return values
  end

  def postorder(current_node = @root, values = [])
    return nil if current_node == nil
    postorder(current_node.left, values)
    postorder(current_node.right, values)
    values.push(current_node.data)
    return values
  end

  def height(node = @root, height = 0)
    return height-1 if node == nil
    l_height = height(node.left, height+1)
    r_height = height(node.right, height+1)
    if l_height > r_height
      return l_height
    else
      return r_height
    end
  end

  def depth(value)
    current_node = @root
    depth = 0
    while (current_node.data != value)
      if value > current_node.data
        current_node = current_node.right
        depth += 1
      else
        current_node = current_node.left
        depth += 1
      end
    end
    return depth
  end

  def balanced?
    if height(@root.right) - height(@root.left) <= 1
      return true
    else
      return false
    end
  end

  def rebalance
    array = inorder()
    @root = build_tree(array)
  end

  def find(value)
    current_node = @root
    while current_node != nil
      if value > current_node.data
        current_node = current_node.right
      elsif value < current_node.data
        current_node = current_node.left
      else
        return current_node
      end
    end
    return "Node not found"
  end

  private

  def build_tree(array)
    mid = array.length/2
    root = Node.new(array[mid])
    return nil if array.length <= 0
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1...array.length])
    return root
  end

  def find_successor(node)
    current = node.right
    while current.left != nil
      ancestor = current
      current = current.left
    end
    ancestor.left = nil
    successor = current
    return successor
  end

end


tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree.balanced?
p tree.level_order
p tree.inorder
p tree.preorder
p tree.postorder
tree.insert(115)
tree.insert(200)
tree.insert(135)
tree.insert(1000)
tree.insert(344)
puts tree.balanced?
tree.rebalance
puts tree.balanced?
p tree.level_order
p tree.inorder
p tree.preorder
p tree.postorder
