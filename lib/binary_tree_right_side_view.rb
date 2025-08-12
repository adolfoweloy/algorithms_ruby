# This class implements the Binary Tree Right Side View algorithm
# To run the test, execute bundle exec rspec ./spec/binary_tree_right_side_view_spec.rb
class BinaryTreeRightSideView
  def right_side_view(root)
    solution = BFSBinaryTreeRightSideView.new
    solution.right_side_view(root)
  end
end

class BFSBinaryTreeRightSideView < BinaryTreeRightSideView
  def right_side_view(root)
    # Handle edge cases
    return [] if root.nil?

    result = []
    level = Queue.new
    level << root

    while level.size > 0
      n = level.size
      node = nil
      n.times do
        node = level.pop
        level << node.left unless node.left.nil?
        level << node.right unless node.right.nil?
      end

      result << node.val
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
end
