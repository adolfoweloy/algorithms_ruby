# This class implements the Surrounded Regions algorithm
# To run the test, execute bundle exec rspec ./spec/surrounded_regions_spec.rb
class SurroundedRegions
  def solve(board)
    # Handle edge cases
    return if board.nil? || board.empty? || board[0].empty?

    for i in 0...board.size
      for j in 0...board[0].size
        @region = []
        open = dfs(board, i, j)
        undo!(board) if open
      end
    end

    board
  end

  def dfs(board, i, j)
    return false if i < 0 || i >= board.size || j < 0 || j >= board[0].size
    return false if board[i][j] == "X"
    return true if edge?(board, i, j)

    board[i][j] = "X"
    @region << [i, j]

    dfs(board, i+1, j) ||
    dfs(board, i-1, j) ||
    dfs(board, i, j+1) ||
    dfs(board, i, j-1)
  end

  def edge?(board, i, j)
    i == 0 || i == board.size-1 || j == 0 || j == board[0].size-1
  end

  def undo!(board)
    @region.each do |r|
      (i, j) = r
      board[i][j] = "O"
    end
  end
end
