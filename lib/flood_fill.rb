# This class implements the flood fill algorithm
# To run the test, execute bundle exec rspec ./spec/flood_fill_spec.rb
class FloodFill
  def flood_fill(image, sr, sc, color)
    return [] if image.nil? || image == []
    prev = image[sr][sc]


    queue = [[sr, sc]]

    while queue.size > 0
      n = queue.size
      n.times do
        (x, y) = queue.pop

        # Check boundaries first
        next if x < 0 || x >= image.size
        next if y < 0 || y >= image[0].size

        if image[x][y] == prev && image[x][y] != color
          image[x][y] = color

          queue.prepend [x+1, y]
          queue.prepend [x-1, y]
          queue.prepend [x, y+1]
          queue.prepend [x, y-1]
        end
      end
    end

    image
  end

end
