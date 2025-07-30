
# This class implements BFS to collect tree node values grouped by level
# To run the test, execute bundle exec rspec ./spec/level_order_spec.rb
class LevelOrder
  def solution(root)
    return [] if root.nil?

    queue = [root]
    result = []

    while !queue.empty?
      level = []
      level_size = queue.size

      level_size.times do
        node = queue.pop
        level << node.val

        queue.prepend node.left unless node.left.nil?
        queue.prepend node.right unless node.right.nil?
      end

      result << level
    end

    result
  end
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def to_s
    @val.to_s
  end
end
