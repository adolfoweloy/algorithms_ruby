require_relative "../lib/surrounded_regions.rb"
require "rspec"

RSpec.describe SurroundedRegions do
  let(:subject) { SurroundedRegions.new }

  describe "#solve" do
    context "when board is empty or nil" do
      it "handles nil board" do
        expect(subject.solve(nil)).to be_nil
      end

      it "handles empty board" do
        expect(subject.solve([])).to be_nil
      end

      it "handles board with empty rows" do
        board = [[]]
        expect(subject.solve(board)).to be_nil
      end
    end

    context "when board has single cell" do
      it "handles single X cell" do
        board = [["X"]]
        subject.solve(board)
        expect(board).to eq([["X"]])
      end

      it "handles single O cell" do
        board = [["O"]]
        subject.solve(board)
        expect(board).to eq([["O"]])
      end
    end

    context "leetcode example 1" do
      it "captures surrounded regions" do
        board = [
          ["X","X","X","X"],
          ["X","O","O","X"],
          ["X","X","O","X"],
          ["X","O","X","X"]
        ]
        expected = [
          ["X","X","X","X"],
          ["X","X","X","X"],
          ["X","X","X","X"],
          ["X","O","X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "leetcode example 2" do
      it "handles single row with O" do
        board = [["X"]]
        expected = [["X"]]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "when O regions touch border" do
      it "preserves O regions connected to border" do
        board = [
          ["O","X","X"],
          ["X","O","X"],
          ["X","X","O"]
        ]
        expected = [
          ["O","X","X"],
          ["X","X","X"],  # This O should be captured as it's not connected to border
          ["X","X","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "when O regions don't touch border" do
      it "captures completely surrounded O regions" do
        board = [
          ["X","X","X","X"],
          ["X","O","O","X"],
          ["X","O","O","X"],
          ["X","X","X","X"]
        ]
        expected = [
          ["X","X","X","X"],
          ["X","X","X","X"],
          ["X","X","X","X"],
          ["X","X","X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "when board is all X" do
      it "leaves board unchanged" do
        board = [
          ["X","X","X"],
          ["X","X","X"],
          ["X","X","X"]
        ]
        expected = [
          ["X","X","X"],
          ["X","X","X"],
          ["X","X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "when board is all O" do
      it "preserves all O since they're all connected to border" do
        board = [
          ["O","O","O"],
          ["O","O","O"],
          ["O","O","O"]
        ]
        expected = [
          ["O","O","O"],
          ["O","O","O"],
          ["O","O","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "when O forms border" do
      it "preserves O border" do
        board = [
          ["O","O","O"],
          ["O","X","O"],
          ["O","O","O"]
        ]
        expected = [
          ["O","O","O"],
          ["O","X","O"],
          ["O","O","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "complex mixed pattern" do
      it "handles multiple surrounded and unsurrounded regions" do
        board = [
          ["O","X","X","O","X"],
          ["X","O","O","X","O"],
          ["X","O","X","O","X"],
          ["O","X","O","O","O"],
          ["X","X","O","X","O"]
        ]
        expected = [
          ["O","X","X","O","X"],
          ["X","X","X","X","O"],
          ["X","X","X","O","X"],
          ["O","X","O","O","O"],
          ["X","X","O","X","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "single row board" do
      it "preserves all O in single row" do
        board = [["O","X","O","O","X"]]
        expected = [["O","X","O","O","X"]]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "single column board" do
      it "preserves all O in single column" do
        board = [["O"],["X"],["O"],["O"],["X"]]
        expected = [["O"],["X"],["O"],["O"],["X"]]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "2x2 board" do
      it "handles minimal surrounded region" do
        board = [
          ["X","X"],
          ["X","X"]
        ]
        expected = [
          ["X","X"],
          ["X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end

      it "handles 2x2 with O touching border" do
        board = [
          ["O","X"],
          ["X","O"]
        ]
        expected = [
          ["O","X"],
          ["X","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "large board pattern" do
      it "handles complex large board with multiple regions" do
        board = [
          ["X","O","X","X","X","X"],
          ["X","O","X","X","X","X"],
          ["X","X","X","O","O","X"],
          ["X","X","X","O","O","X"],
          ["X","X","X","X","X","X"],
          ["O","O","X","X","X","X"]
        ]
        expected = [
          ["X","O","X","X","X","X"],
          ["X","O","X","X","X","X"],
          ["X","X","X","X","X","X"],
          ["X","X","X","X","X","X"],
          ["X","X","X","X","X","X"],
          ["O","O","X","X","X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "board with O on edges only" do
      it "preserves all edge O regions" do
        board = [
          ["O","X","O"],
          ["X","X","X"],
          ["O","X","O"]
        ]
        expected = [
          ["O","X","O"],
          ["X","X","X"],
          ["O","X","O"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end

    context "board with connected regions" do
      it "handles O region connected to border through narrow path" do
        board = [
          ["O","X","X","X"],
          ["O","X","O","X"],
          ["O","O","O","X"],
          ["X","X","X","X"]
        ]
        expected = [
          ["O","X","X","X"],
          ["O","X","O","X"],
          ["O","O","O","X"],
          ["X","X","X","X"]
        ]
        subject.solve(board)
        expect(board).to eq(expected)
      end
    end
  end
end
