MOVES = [
  [2, 1], [1, 2], [-1, 2], [-2, 1],
  [-2, -1], [-1, -2], [1, -2], [2, -1]
]

def valid_pos?(x, y)
  x.between?(0, 7) && y.between?(0,7)
end

def knight_moves(start_pos, end_pos)
  queue = [[start_pos, [start_pos]]]
  visited = Array.new(8) { Array.new(8, false) }
  visited[start_pos[0]][start_pos[1]] = true

  until queue.empty?
    current_pos, path = queue.shift
    return print_path(path) if current_pos == end_pos

    x, y = current_pos
    MOVES.each do |dx, dy|
      new_x, new_y = x + dx, y + dy

      if valid_pos?(new_x, new_y) && !visited[new_x][new_y]
        visited[new_x][new_y] = true
        queue << [[new_x, new_y], path + [[new_x, new_y]]]
      end
    end
  end
end

def print_path(path)
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.each { |pos| p pos }
end

knight_moves([0,0],[3,3])