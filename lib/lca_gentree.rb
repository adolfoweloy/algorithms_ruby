class LowestCommonAncestorGenericTree
  
  def search(root, query)
    self.helper(root, query)[:lca]
  end
  
  def helper(node, query)
    return {lca: nil, count: 0} if node.nil?
    total = query.include?(node) ? 1 : 0

    # starts the logic of searching recursively over node's children
    for child in node.children
      res = self.helper(child, query)
      return res if !res[:lca].nil?
      total += res[:count]
    end

    return {lca: node, count: total} if total == query.size

    {lca: nil, count: total}
  end

end

class GenericTreeNode
  attr_accessor :value, :children

  def initialize(value, children = [])
    @value = value
    @children = children
  end
end