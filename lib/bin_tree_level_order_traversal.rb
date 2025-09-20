require "pry-byebug"
require_relative "../lib/datastructure/tree_node"

class BinaryTreeLevelOrderTraversal

  def level_order(root)
    queue = [root]
    res = []

    while !queue.empty?
      n = queue.size
      tmp = []

      n.times do
        node = queue.shift
        unless node.nil?
          tmp << node.val
          queue << node.left
          queue << node.right
        end
      end

      res << tmp unless tmp.empty?
    end

    return res
  end

end
