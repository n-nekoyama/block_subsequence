X = 3

# substr が string の部分列であれば true
def subsequence?(substr, string)
  i = 0
  string.each_char do |c|
    next unless c == substr[i]
    i += 1
    return true if i == substr.length
  end
  return false
end

# 文字列が property * を持っていたら true
def has_property_asterisk?(string)
  1.upto(string.length / 2 - 1) do |i|
    (i + 1).upto(string.length / 2) do |j|
      return false if subsequence?(string[(i - 1)..(2 * i - 1)], string[(j - 1)..(2 * j - 1)])
    end
  end
  return true
end

def n(x)
  last_char = x.to_s
  string = "1"
  longest_string = ""

  until string.empty? || string == "2"
    if has_property_asterisk?(string)
      if string.length > longest_string.length
        puts "n(#{x}) >= #{string.length} (#{string})"
        longest_string = string.dup
      end
      string << "1"
    else
      string.delete_suffix!(last_char) while string.end_with?(last_char)
      string.succ!
    end
  end
  return longest_string.length
end

puts "n(#{X}) = #{n(X)}"
