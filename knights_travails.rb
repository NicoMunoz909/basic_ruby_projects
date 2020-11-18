class Board
  
  attr_reader :cells

  def initialize
    @cells = [1,2,3,4,5,6,7,8].repeated_permutation(2).to_a
  end

end

class Knight

  attr_reader :moves, :coords

  def initialize(coords)
    @coords = coords
    @moves = possible_moves()
  end

  def move_to(destination)
    @coords = destination
    @moves = possible_moves()
  end

  def possible_moves
    moves = [[1,2], [1,-2], [2,1], [2,-1], [-1,2], [-1,-2], [-2,-1], [-2,1]]
    possible_moves = []
    moves.each {|move|
      next_position = Move.new
      next_position.coords = [@coords[0]+move[0], @coords[1]+move[1]]
      next_position.prev = @coords
      possible_moves.push(next_position)  unless inexistant?(next_position.coords)
    }
    return possible_moves
  end

  def inexistant?(cell)
    if cell[0] < 1 || cell[0] > 8 || cell[1] < 1 || cell[1] > 8
      return true
    else 
      return false
    end
  end

end

class Move #Class used to save the knight previous position

  attr_accessor :coords, :prev

  def initialize()
    @coords = []
    @prev = []
  end

end

def knight_moves(start, finish)

  #Create a Knight and arrays used to keep track of the queue, visited cells and previous position
  knight = Knight.new(start)
  queue = []
  visited = []
  prev = []

  prev.push(nil) #Starting position doesn't have a previous cell
  visited.push(knight.coords) #Mark starting cell as visited

  #Do a BFS of all possible movements

  knight.moves.each {|move| 
    queue.push(move.coords)
    prev.push(move.prev)
    visited.push(move.coords)
  }

  while !queue.empty? 

    next_pos = queue.shift
    knight.move_to(next_pos)

    knight.moves.each {|move|
      queue.push(move.coords) unless visited.include?(move.coords)
      prev.push(move.prev) unless visited.include?(move.coords)
      visited.push(move.coords) unless visited.include?(move.coords)
    }

  end

  #Make the path
  path = []
  path.push(finish) #First push the destination cell
  while !(finish == start)
    index = visited.find_index(finish)  #Search for index of the destination cell in visited cells array
    path.push(prev[index]) #Push its predecessor to the path
    finish = prev[index] #Change the destination to be its predecessor
  end

  return path.reverse

end

p knight_moves([1,2],[8,7])
