require_relative "../lib/longest_substring_without_repeating_characters.rb"
require "rspec"

RSpec.describe LongestSubstringWithoutRepeatingCharacters do
  let(:subject) { LongestSubstringWithoutRepeatingCharacters.new }

  describe "#length_of_longest_substring" do
    context "when string is empty or nil" do
      it "returns 0 for nil input" do
        expect(subject.length_of_longest_substring(nil)).to eq(0)
      end

      it "returns 0 for empty string" do
        expect(subject.length_of_longest_substring("")).to eq(0)
      end
    end

    context "when string has single character" do
      it "returns 1 for single character" do
        expect(subject.length_of_longest_substring("a")).to eq(1)
      end
    end

    context "leetcode example 1" do
      it "handles string with repeating characters" do
        expect(subject.length_of_longest_substring("abcabcbb")).to eq(3)
      end
    end

    context "leetcode example 2" do
      it "handles string with all same characters" do
        expect(subject.length_of_longest_substring("bbbbb")).to eq(1)
      end
    end

    context "leetcode example 3" do
      it "handles string with spaces and punctuation" do
        expect(subject.length_of_longest_substring("pwwkew")).to eq(3)
      end
    end

    context "when string has no repeating characters" do
      it "returns length of entire string" do
        expect(subject.length_of_longest_substring("abcdef")).to eq(6)
      end

      it "handles single character string with no repeats" do
        expect(subject.length_of_longest_substring("x")).to eq(1)
      end
    end

    context "when string has spaces" do
      it "treats spaces as characters" do
        expect(subject.length_of_longest_substring("a b c")).to eq(5)
      end

      it "handles repeating spaces" do
        expect(subject.length_of_longest_substring("a  b")).to eq(2)
      end
    end

    context "when string has special characters" do
      it "handles punctuation marks" do
        expect(subject.length_of_longest_substring("a!@#b!")).to eq(5)
      end

      it "handles mixed alphanumeric and special chars" do
        expect(subject.length_of_longest_substring("abc123!@#")).to eq(9)
      end
    end

    context "when longest substring is at the beginning" do
      it "finds substring at start" do
        expect(subject.length_of_longest_substring("abcabc")).to eq(3)
      end
    end

    context "when longest substring is at the end" do
      it "finds substring at end" do
        expect(subject.length_of_longest_substring("aabcdef")).to eq(6)
      end
    end

    context "when longest substring is in the middle" do
      it "finds substring in middle" do
        expect(subject.length_of_longest_substring("aabcdefgg")).to eq(6)
      end
    end

    context "when string has alternating pattern" do
      it "handles alternating characters" do
        expect(subject.length_of_longest_substring("abab")).to eq(2)
      end
    end

    context "when string has numbers" do
      it "handles numeric characters" do
        expect(subject.length_of_longest_substring("12321")).to eq(3)
      end

      it "handles mixed letters and numbers" do
        expect(subject.length_of_longest_substring("a1b2c3a")).to eq(6)
      end
    end

    context "edge cases with long strings" do
      it "handles long string with no repeats" do
        long_string = ("a".."z").to_a.join
        expect(subject.length_of_longest_substring(long_string)).to eq(26)
      end

      it "handles long string with early repeat" do
        expect(subject.length_of_longest_substring("abcdefga")).to eq(7)
      end
    end

    context "case sensitivity" do
      it "treats uppercase and lowercase as different" do
        expect(subject.length_of_longest_substring("aA")).to eq(2)
      end

      it "handles mixed case string" do
        expect(subject.length_of_longest_substring("abcABC")).to eq(6)
      end
    end

    context "unicode characters" do
      it "handles unicode characters" do
        expect(subject.length_of_longest_substring("🙂🙃😊🙂")).to eq(3)
      end
    end

    context "complex patterns" do
      it "handles complex repeating pattern" do
        expect(subject.length_of_longest_substring("abccba")).to eq(3)
      end

      it "handles pattern with immediate repeat" do
        expect(subject.length_of_longest_substring("aab")).to eq(2)
      end

      it "handles pattern ending with repeat" do
        expect(subject.length_of_longest_substring("aba")).to eq(2)
      end
    end
  end
end
