# This class implements the Longest Substring Without Repeating Characters algorithm
# To run the test, execute bundle exec rspec ./spec/longest_substring_without_repeating_characters_spec.rb
class LongestSubstringWithoutRepeatingCharacters
  def length_of_longest_substring(s)
    # Handle edge cases
    return 0 if s.nil? || s.empty?

    n = s.size

    set = Set.new
    left = 0
    right  = 0
    max = 0

    while right < n && left <= right

      while !set.include?(s[right]) && right < n
        set << s[right]
        right += 1
      end

      max = [max, right - left].max
      set.delete(s[left])
      if right < n
        left += 1
      end

    end

    max
  end
end
