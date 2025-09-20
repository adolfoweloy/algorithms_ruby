require_relative "../lib/bin_tree_level_order_traversal.rb"
require "rspec"

RSpec.describe BinaryTreeLevelOrderTraversal do
  let(:subject) { BinaryTreeLevelOrderTraversal.new }

  it "case 1" do
    root = TreeNode.deserialize([3,9,20,nil,nil,15,7])
    expect(subject.level_order(root)).to eq([[3],[9,20],[15,7]])
  end

  it "case 2" do
    root = TreeNode.deserialize([1])
    expect(subject.level_order(root)).to eq([[1]])
  end

  it "case 3" do
    root = nil
    expect(subject.level_order(root)).to eq([])
  end

  it "case 4" do
    root = TreeNode.deserialize([3,9,20,nil,nil,15,7, nil,nil, 5, 60])
    expect(subject.level_order(root)).to eq([[3],[9,20],[15,7],[5,60]])
  end
end
