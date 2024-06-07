alphas = {}
(1..26).each do |key|
    alphas[key] = (key + 96).chr
end

p "Please enter a string that you'd like to convert to a cipher."
words = gets.chomp

p "Please enter the number you'd like to shift each letter to."
shift = gets.chomp
shift = shift.to_i

while shift.is_a?(Integer) && shift <= 0
    p "Please enter a POSITIVE WHOLE NUMBER for the amount you'd like to shift each letter to."
    shift = gets.chomp
    shift = shift.to_i
end

words.each do |index|
    words[index] = 