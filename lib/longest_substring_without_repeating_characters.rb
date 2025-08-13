# This class implements the Longest Substring Without Repeating Characters algorithm
# To run the test, execute bundle exec rspec ./spec/longest_substring_without_repeating_characters_spec.rb
class LongestSubstringWithoutRepeatingCharacters
  def length_of_longest_substring(s)
    # Handle edge cases
    return 0 if s.nil? || s.empty?

    n = s.size

    set = Set.new
    left = 0
    right = 0
    max = 0

    while right < n
        # If current character is already in set, shrink window from left
        while set.include?(s[right])
            set.delete(s[left])
            left += 1
        end

        # Add current character and expand window
        set << s[right]
        max = [max, right - left + 1].max
        right += 1
    end

    max
  end
end
