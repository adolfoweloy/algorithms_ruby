class SerializeTree
  def serialize(root)
    return [] if root.nil?

    queue = [root]
    res = []

    while !queue.empty?
      n = queue.size

      n.times do
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

    while !res.empty? && res.last.nil?
      res.pop
    end

    return res
  end

  def deserialize(data)
    return nil if data.empty?

    i = 0
    root = TreeNode.new(data[i])
    queue = [root]

    while !queue.empty?
      n = queue.size
      n.times do
        node = queue.shift

        i += 1
        if i < data.size && !data[i].nil?
          node.left = TreeNode.new(data[i])
          queue << node.left
        end

        i += 1
        if i < data.size && !data[i].nil?
          node.right = TreeNode.new(data[i])
          queue << node.right
        end
      end
    end


    return root
  end
end
