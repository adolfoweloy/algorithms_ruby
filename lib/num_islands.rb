# This class implements the Number of Islands algorithm
# To run the test, execute bundle exec rspec ./spec/num_islands_spec.rb
class NumIslands
  def num_islands(grid)
    return 0 if grid.nil?
    count = 0
    for i in 0...grid.length
      for j in 0...grid[0].length
        if grid[i][j] == '1'
          count += 1
          visit_nodes(grid, i, j)
        end
      end
    end
    count
  end

  def visit_nodes(grid, i, j)
    return unless i.between?(0, grid.length-1) && j.between?(0, grid[0].length-1)
    return if grid[i][j] == '0'

    grid[i][j] = '0'

    visit_nodes(grid, i+1, j)
    visit_nodes(grid, i-1, j)
    visit_nodes(grid, i, j+1)
    visit_nodes(grid, i, j-1)
  end
end
