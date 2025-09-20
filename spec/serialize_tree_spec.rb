require_relative "../lib/serialize_tree.rb"
require_relative "../lib/datastructure/tree_node.rb"
require "rspec"

RSpec.describe SerializeTree do
  let(:subject) { SerializeTree.new }

  describe "serialization" do
    it "case 1" do
      root = TreeNode.new(1)
      result = subject.serialize(root)
      expect(result).to eq([1])
    end

    it "case 2" do
      root = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
      result = subject.serialize(root)
      expect(result).to eq([1, 2, 3])
    end

    it "case 3" do
      root = TreeNode.new(1, nil, TreeNode.new(2, TreeNode.new(3), nil))
      expect(subject.serialize(root)).to eq([1, nil, 2, 3])
    end

    it "case 4" do
      left = TreeNode.new(4, TreeNode.new(3, TreeNode.new(-1), nil), nil)
      right = TreeNode.new(7, TreeNode.new(2, TreeNode.new(9), nil), nil)
      root = TreeNode.new(5, left, right)
      expect(subject.serialize(root)).to eq([5,4,7,3,nil,2,nil,-1,nil,9])
    end
  end

  describe "deserialization" do
    it "case 1" do
      result = subject.deserialize([1])
      expected = TreeNode.new(1)
      expect(result).to eq(expected)
    end

    it "case 2" do
      result = subject.deserialize([1,2,3])
      expected = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
      expect(result).to eq(expected)
    end

    it "case 3" do
      left = TreeNode.new(2)
      right = TreeNode.new(3, TreeNode.new(4), TreeNode.new(5))
      expected = TreeNode.new(1, left, right)
      result = subject.deserialize([1,2,3,nil,nil,4,5])
      expect(result).to eq(expected)
    end
  end
end
