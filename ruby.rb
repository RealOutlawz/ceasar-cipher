print "Enter a string: "
string = gets
print "Enter your desired shift: "
shift = gets.to_i


def caesar_cipher(str, shift_num)
  temp_arr = []
  str.each_char.with_index do |val, idx|
    if val != val.downcase
      temp_arr.push(idx)
    end
  end

  new_str = str.downcase!.split("")
  new_str.map! {|val| val.ord}
  new_str.map! {|val| val+= shift_num}
  new_str.map! {|val| ((val - 97) % 26 + 97).chr}

  str = new_str.inspect
print str
end

caesar_cipher(string, shift)


# how to shift alphabet and wrap around
def shift_alphabet(array, shift)
  new_alphabet = []
  array.map {|str| new_alphabet.push(str.ord)}
  print "org array: #{array}\n"

  new_alphabet.map! {|val| val+= shift}

  new_alphabet.map! {|val| ((val - 97) % 26 + 97).chr}
  puts "mod array: #{new_alphabet}\n"

end






