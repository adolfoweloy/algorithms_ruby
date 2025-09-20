require_relative "../../lib/datastructure/tree_node.rb"
require "rspec"

RSpec.describe TreeNode do


  describe "serialization" do
    it "should serialize a tree with only one node" do
      root = TreeNode.new(1)
      expect(root.serialize).to eq([1])
    end

    it "should serialize a complete tree with tree elements" do
      root = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
      expect(root.serialize).to eq([1,2,3])
    end

    it "should serialize an incomplete tree" do
      root = TreeNode.new(1, nil, TreeNode.new(2, TreeNode.new(3), nil))
      expect(root.serialize).to eq([1, nil, 2, 3])
    end

    it "should serialize an incomplete and more complex tree" do
      left = TreeNode.new(4, TreeNode.new(3, TreeNode.new(-1), nil), nil)
      right = TreeNode.new(7, TreeNode.new(2, TreeNode.new(9), nil), nil)
      root = TreeNode.new(5, left, right)
      expect(root.serialize).to eq([5,4,7,3,nil,2,nil,-1,nil,9])
    end
  end

  describe "deserialization" do
    it "should deserialize a tree with only one node" do
      result = TreeNode.deserialize([1])
      expected = TreeNode.new(1)
      expect(result).to eq(expected)
    end

    it "should deserialize a complete tree with tree elements" do
      result = TreeNode.deserialize([1,2,3])
      expected = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
      expect(result).to eq(expected)
    end
  end
end
