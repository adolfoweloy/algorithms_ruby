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
end