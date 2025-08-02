print "Enter a string: "
string = gets.chomp
print "Enter your desired shift: "
shift = gets.to_i


def caesar_cipher(str, shift_num)
  track_capitals_array = []
  track_non_alpha = {}

  # Finds where the capital letters in the string are
  str.each_char.with_index do |val, idx|
    if val != val.downcase
      track_capitals_array.push(idx)
    end
  end

  # Finds any nonalphabetical letters and their positions, saves them to a hash, then takes them out of the string
  str.each_char.with_index do |chr, chr_index|
    if !chr.downcase.ord.between?(97, 122)
      track_non_alpha[chr_index] = chr
      str.slice!(chr)
    end
  end

  # Lowercase all letters and split into array
  new_str = str.downcase!.split("")

  # Turns all letters into ascii value
  new_str.map! {|val| val.ord}

  # Adds shift to all letters
  new_str.map! {|val| val+= shift_num}

  # Turns all ascii values back into letters
  new_str.map! {|val| ((val - 97) % 26 + 97).chr}

  str = new_str.join

  # Uses hash from eariler to re-insert all nonalphabetical letters
  track_non_alpha.each_pair {|key, val| str.insert(key, val)}

  # Uses array that help postion of capital letters to re-capitalize letters
  track_capitals_array.each {|cap_letter| str[cap_letter] = str[cap_letter].upcase!}
  
  puts str
end

caesar_cipher(string, shift)