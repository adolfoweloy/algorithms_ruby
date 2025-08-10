# This class implements the flood fill algorithm
# To run the test, execute bundle exec rspec ./spec/flood_fill_spec.rb
class FloodFill
  def flood_fill(image, sr, sc, color)
    return [] if image.nil? || image == []
    prev = image[sr][sc]

    # If the starting color is already the target color, no need to fill
    return image if prev == color

    dfs(image, sr, sc, color, prev)
    image
  end

  def dfs(image, sr, sc, color, prev_color)
    n = image.size
    m = image[0].size

    return if sr < 0 || sr >= n || sc < 0 || sc >= m

    if image[sr][sc] == prev_color

      # Color the current pixel
      image[sr][sc] = color

      # Recursively fill adjacent pixels (4-directional)
      dfs(image, sr + 1, sc, color, prev_color)
      dfs(image, sr - 1, sc, color, prev_color)
      dfs(image, sr, sc + 1, color, prev_color)
      dfs(image, sr, sc - 1, color, prev_color)
    end
  end
end
