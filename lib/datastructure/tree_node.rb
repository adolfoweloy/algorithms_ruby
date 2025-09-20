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

  def self.deserialize(data)
    return nil if data.nil? || data.empty?

    i = 0
    root = TreeNode.new(data[i])
    queue = [root]
    len = data.size

    while !queue.empty?
      node = queue.shift

      i = i + 1
      if i < len && !data[i].nil?
        node.left = TreeNode.new(data[i])
        queue << node.left
      end

      i = i + 1
      if i < len && !data[i].nil?
        node.right = TreeNode.new(data[i])
        queue << node.right
      end
    end

    return root
  end

  def ==(other)
    return false unless other.is_a?(TreeNode)
    @val == other.val && @left == other.left && @right == other.right
  end

  def hash
    [@val, @left, @right].hash
  end
end
