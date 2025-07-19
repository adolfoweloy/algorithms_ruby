class LowestCommonAncestor
  def search(root, p, q)
    return nil if root.nil?
    return root if root == p || root == q

    left = search(root.left, p, q)
    right = search(root.right, p, q)

    return root if left && right

    left || right
  end

end

class TreeNode 
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
