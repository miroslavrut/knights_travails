class Chess
  attr_accessor :board

  def board
    board = Array.new
    8.times {|x| 8.times {|y| board << [x,y]}}
    return board
  end
end


class Knight < Chess
  attr_accessor :possible_moves,  :knight_graph

  def initialize
    @moves = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-2]]
    make_graph
  end

  def find_possible_moves(position)
    @possible_moves = Array.new
    @moves.each do |x|
      next_pos = [position[0] + x[0], position[1] + x[1]]
      @possible_moves << board.index(next_pos) if board.include?(next_pos)
    end
    return @possible_moves
  end

  def make_graph
    @knight_graph = []
    board.each {|p| @knight_graph << find_possible_moves(p)}
  end

  def bfs
    que = [@starting_position]
    visited_nodes = []
    path = []
    until que.empty?
      node = que.shift
      visited_nodes << node
      @knight_graph[node].each do |child|
        path[child] = node if path[child] == nil
        return path if child == @final_position
        que << child unless que.include?(child) || visited_nodes.include?(child)
      end
    end
  end

  def find_shortest_path(path)
    shortest_path = [@final_position]
    loop do 
      shortest_path << path[shortest_path[-1]]
      break if shortest_path[-1] == @starting_position
    end
    shortest_path
  end

  def print_path
    puts "Shortest path is made in #{@path_array.length - 1} moves!"
    puts "This is path: "
    @path_array.reverse.each {|x| puts board[x].to_s}
  end

  def knight_moves(starting_position, final_position)
    @starting_position = board.index(starting_position)
    @final_position = board.index(final_position)
    @path_array = find_shortest_path(bfs())
    print_path
  end
end


knight = Knight.new
knight.knight_moves([3,3],[4,3]) 

# >> Shortest path is made in 3 moves!
# >> This is path: 
# >> [3, 3]
# >> [4, 1]
# >> [6, 2]
# >> [4, 3]