require_relative "../lib/binary_tree_right_side_view.rb"
require "rspec"

RSpec.describe BinaryTreeRightSideView do
  let(:subject) { BinaryTreeRightSideView.new }

  describe "#right_side_view" do
    context "when the tree is empty" do
      it "returns an empty array" do
        expect(subject.right_side_view(nil)).to eq([])
      end
    end

    context "when the tree has a single node" do
      it "returns array with that single value" do
        root = TreeNode.new(1)
        expect(subject.right_side_view(root)).to eq([1])
      end
    end

    context "leetcode example 1" do
      #
      #     1
      #    / \
      #   2   3
      #    \   \
      #     5   4
      #
      it "returns the rightmost node at each level" do
        root = TreeNode.new(1,
          TreeNode.new(2, nil, TreeNode.new(5)),
          TreeNode.new(3, nil, TreeNode.new(4))
        )
        expect(subject.right_side_view(root)).to eq([1, 3, 4])
      end
    end

    context "leetcode example 2" do
      #
      #   1
      #    \
      #     3
      #
      it "handles right-skewed tree" do
        root = TreeNode.new(1, nil, TreeNode.new(3))
        expect(subject.right_side_view(root)).to eq([1, 3])
      end
    end

    context "leetcode example 3" do
      #
      #   1
      #  /
      # 2
      #
      it "handles left-skewed tree" do
        root = TreeNode.new(1, TreeNode.new(2), nil)
        expect(subject.right_side_view(root)).to eq([1, 2])
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
      it "returns rightmost nodes from each level" do
        root = TreeNode.new(1,
          TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)),
          TreeNode.new(3)
        )
        expect(subject.right_side_view(root)).to eq([1, 3, 5])
      end
    end

    context "when left subtree is deeper than right" do
      #
      #     1
      #    / \
      #   2   3
      #  /
      # 4
      #
      it "includes leftmost node when it's the only one at that level" do
        root = TreeNode.new(1,
          TreeNode.new(2, TreeNode.new(4), nil),
          TreeNode.new(3)
        )
        expect(subject.right_side_view(root)).to eq([1, 3, 4])
      end
    end

    context "complex tree structure" do
      #
      #         1
      #        / \
      #       2   3
      #      / \   \
      #     4   5   6
      #    /         \
      #   7           8
      #
      it "handles complex tree with varying depths" do
        root = TreeNode.new(1,
          TreeNode.new(2,
            TreeNode.new(4, TreeNode.new(7), nil),
            TreeNode.new(5)
          ),
          TreeNode.new(3, nil,
            TreeNode.new(6, nil, TreeNode.new(8))
          )
        )
        expect(subject.right_side_view(root)).to eq([1, 3, 6, 8])
      end
    end

    context "tree with only left children" do
      #
      #   1
      #  /
      # 2
      #/
      #3
      #
      it "returns all nodes when tree is completely left-skewed" do
        root = TreeNode.new(1,
          TreeNode.new(2,
            TreeNode.new(3), nil
          ),
          nil
        )
        expect(subject.right_side_view(root)).to eq([1, 2, 3])
      end
    end

    context "tree with only right children" do
      #
      # 1
      #  \
      #   2
      #    \
      #     3
      #
      it "returns all nodes when tree is completely right-skewed" do
        root = TreeNode.new(1, nil,
          TreeNode.new(2, nil,
            TreeNode.new(3)
          )
        )
        expect(subject.right_side_view(root)).to eq([1, 2, 3])
      end
    end

    context "tree with negative values" do
      #
      #    -1
      #   /  \
      #  -2  -3
      #
      it "handles negative node values correctly" do
        root = TreeNode.new(-1,
          TreeNode.new(-2),
          TreeNode.new(-3)
        )
        expect(subject.right_side_view(root)).to eq([-1, -3])
      end
    end

    context "large tree with duplicate values" do
      #
      #     1
      #    / \
      #   1   1
      #  /   / \
      # 1   1   1
      #
      it "handles duplicate values correctly" do
        root = TreeNode.new(1,
          TreeNode.new(1, TreeNode.new(1), nil),
          TreeNode.new(1, TreeNode.new(1), TreeNode.new(1))
        )
        expect(subject.right_side_view(root)).to eq([1, 1, 1])
      end
    end
  end
end
