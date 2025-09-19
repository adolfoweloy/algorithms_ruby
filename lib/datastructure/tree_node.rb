class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def serialize()
    queue = [self]
    res = []

    while !queue.empty?
      level_size = queue.size

      level_size.times do
        node = queue.shift

        if node.nil?
          res << nil
        else
          res << node.val
          queue << node.left
          queue << node.right
        end
      end
    end

    # Remove trailing nils
    while !res.empty? && res.last.nil?
      res.pop
    end

    return res
  end
end
