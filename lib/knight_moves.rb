
class KnightMoves
  def min_knight_moves(x, y)
    return 0 if x == 0 && y == 0

    offsets = [
      [1, 2],[2, 1],
      [2,-1],[1,-2],
      [-1,-2],[-2,-1],
      [-2,1],[-1,2]
    ]

    queue = [[0,0]]
    count = 0
    visited = Set.new

    while !queue.empty?
      level_size = queue.size

      level_size.times do
        (x1, y1) = queue.pop
        return count if y1 == y && x1 == x
        offsets.each do |offset|
          npos = [x1 + offset[0], y1 + offset[1]]
          unless visited.include? npos
            queue.prepend npos
            visited << npos
          end
        end
      end
      count = count + 1
    end

    return count
  end
end
