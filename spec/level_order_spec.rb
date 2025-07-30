# spec/solution_spec.rb
require_relative "../lib/level_order.rb"
require "rspec"

RSpec.describe LevelOrder do
  before(:each) do
    @subj = LevelOrder.new
  end

  context "when the tree is empty" do
    it "returns an empty array" do
      expect(@subj.solution(nil)).to eq([])
    end
  end

  context "when the tree has a single node" do
    it "returns a nested array with that one value" do
      root = TreeNode.new(1)
      expect(@subj.solution(root)).to eq([[1]])
    end
  end

  context "when the tree is balanced" do
    #
    #       1
    #      / \
    #     2   3
    #    / \
    #   4   5
    #
    it "returns each level as a subarray" do
      root = TreeNode.new(1,
        TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)),
        TreeNode.new(3)
      )
      expect(@subj.solution(root)).to eq([[1], [2, 3], [4, 5]])
    end
  end

  context "when the tree is left‑skewed" do
    #
    #   1
    #  /
    # 2
    #/
    #3
    #
    it "handles a single branch correctly" do
      root = TreeNode.new(1,
        TreeNode.new(2,
          TreeNode.new(3), nil
        ),
        nil
      )
      expect(@subj.solution(root)).to eq([[1], [2], [3]])
    end
  end

  context "when the tree is right‑skewed" do
    #
    # 1
    #  \
    #   2
    #    \
    #     3
    #
    it "handles a single branch correctly" do
      root = TreeNode.new(1, nil,
        TreeNode.new(2, nil,
          TreeNode.new(3)
        )
      )
      expect(@subj.solution(root)).to eq([[1], [2], [3]])
    end
  end
end
