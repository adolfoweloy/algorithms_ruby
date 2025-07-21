require_relative "../lib/lca_gentree.rb"
require "rspec"

RSpec.describe LowestCommonAncestorGenericTree do
  let(:subject) { LowestCommonAncestorGenericTree.new }

  it "find lowest common ancestor between tree nodes in a generic tree" do
    p = GenericTreeNode.new(2)
    q = GenericTreeNode.new(3)
    root = GenericTreeNode.new(1, [p, q])

    res = subject.search(root, [p, q])

    expect(res.value).to eq(1)
  end

  it "finds LCA when query contains only the root" do
    root = GenericTreeNode.new(1)
    res = subject.search(root, [root])
    expect(res.value).to eq(1)
  end

  it "finds LCA in a deeper tree" do
    n4 = GenericTreeNode.new(4)
    n5 = GenericTreeNode.new(5)
    n2 = GenericTreeNode.new(2, [n4, n5])
    n6 = GenericTreeNode.new(6)
    n3 = GenericTreeNode.new(3, [n6])
    root = GenericTreeNode.new(1, [n2, n3])
    res = subject.search(root, [n4, n5])
    expect(res.value).to eq(2)
    res2 = subject.search(root, [n4, n6])
    expect(res2.value).to eq(1)
  end

  it "finds LCA when query contains root and a leaf" do
    n2 = GenericTreeNode.new(2)
    root = GenericTreeNode.new(1, [n2])
    res = subject.search(root, [root, n2])
    expect(res.value).to eq(1)
  end

  it "finds LCA in a tree with more than two query nodes" do
    n4 = GenericTreeNode.new(4)
    n5 = GenericTreeNode.new(5)
    n6 = GenericTreeNode.new(6)
    n2 = GenericTreeNode.new(2, [n4, n5])
    n3 = GenericTreeNode.new(3, [n6])
    root = GenericTreeNode.new(1, [n2, n3])
    res = subject.search(root, [n4, n5, n6])
    expect(res.value).to eq(1)
  end
end
