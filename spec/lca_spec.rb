require_relative "../lib/lca.rb"
require "rspec"

RSpec.describe LowestCommonAncestor do
  let(:subject) { LowestCommonAncestor.new }

  it "find lowest common ancestor between two nodes" do
    node2 = TreeNode.new(2)
    node3 = TreeNode.new(3)
    node1 = TreeNode.new(1, node2, node3)

    res = subject.search(node1, node2, node3)

    expect(res.value).to eq(1)
  end

  it "find lowest common ancestor between two nodes with q = root" do
    node2 = TreeNode.new(2)
    node3 = TreeNode.new(3)
    node1 = TreeNode.new(1, node2, node3)

    res = subject.search(node1, node1, node3)

    expect(res.value).to eq(1)
  end

  it "find lowest common ancestor between two nodes with a node that is not a leaf node" do
    node4 = TreeNode.new(4)
    node5 = TreeNode.new(5)
    node2 = TreeNode.new(2, node4, node5)

    node8 = TreeNode.new(8)
    node9 = TreeNode.new(9)
    node6 = TreeNode.new(6, node8, node9)

    node7 = TreeNode.new(7)
    node3 = TreeNode.new(3, node6, node7)

    node1 = TreeNode.new(1, node2, node3)

    res = subject.search(node1, node7, node9)

    expect(res.value).to eq(3)
    
  end
end

