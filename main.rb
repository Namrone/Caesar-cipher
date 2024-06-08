p "Please enter a string that you'd like to convert to a cipher."
words = gets.chomp

p "Please enter the number you'd like to shift each letter to."
shift = gets.chomp
shift = shift.to_i

while shift.is_a?(Integer) && shift <= 0
    p "Please enter a POSITIVE WHOLE NUMBER for the amount you'd like to shift each letter to."
    shift = gets.chomp
    shift = shift.to_i % 26
end

def convert_cipher(ascii, index_to_shift)
    if (ascii - index_to_shift) < 97 #=> To loop the cipher back to the end of the alphabet
        ascii = (ascii - 96 - index_to_shift) + 122
        return ascii.chr
    else
        ascii -= index_to_shift
        return ascii.chr
    end
end

cipher = []

words.each_char do |char|
    if char.match?(/[[:alpha:]]/) #=> Test if the character is a letter
        ascii_char = char.downcase.ord
        if char == char.upcase #=> Statement to keep original character case if it was uppercase
            cipher.push(convert_cipher(ascii_char, shift).upcase)
        else
            cipher.push(convert_cipher(ascii_char, shift))
        end
    else
        cipher.push(char)
    end
end

p cipher.join