# This class implements the Surrounded Regions algorithm
# To run the test, execute bundle exec rspec ./spec/surrounded_regions_spec.rb
class SurroundedRegions
  def solve(board)
    # Handle edge cases
    return if board.nil? || board.empty? || board[0].empty?

    # capture the border open cells (i.e. marked with O)
    rows = board.size
    cols = board[0].size
    borders = []

    for r in 0...rows
      borders << [r, 0]
      borders << [r, cols-1]
    end

    for c in 0...cols
      borders << [0, c]
      borders << [rows-1, c]
    end

    borders.each do |border|
      (i, j) = border
      preserve(board, i, j)
    end

    for i in 0...rows
      for j in 0...cols
        board[i][j] = "X" if board[i][j] == "O"
        board[i][j] = "O" if board[i][j] == "E"
      end
    end

    board
  end

  def preserve(board, i, j)
    return if i < 0 || i >= board.size || j < 0 || j >= board[0].size
    return if board[i][j] == "X" || board[i][j] == "E"

    board[i][j] = "E" # E for edge

    preserve(board, i+1, j) ||
    preserve(board, i-1, j) ||
    preserve(board, i, j+1) ||
    preserve(board, i, j-1)
  end

end
