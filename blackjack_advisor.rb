card_values = {"J" => 10, "Q" => "10", "K" => 10, "A" => [1,11]}
hard_table = {5 => {"2" => "H", "3" => "H", "4" => "H", "5" => "H", "6" => "H",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              6 => {"2" => "H", "3" => "H", "4" => "H", "5" => "H", "6" => "H",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              7 => {"2" => "H", "3" => "H", "4" => "H", "5" => "H", "6" => "H",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              8 => {"2" => "H", "3" => "H", "4" => "H", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              9 => {"2" => "Dh", "3" => "Dh", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              10 => {"2" => "Dh", "3" => "Dh", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "Dh", "8" => "Dh", "9" => "Dh", "10" => "H", "A" => "H"},
              11 => {"2" => "Dh", "3" => "Dh", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "Dh", "8" => "Dh", "9" => "Dh", "10" => "Dh", "A" => "Dh"},
              12 => {"2" => "H", "3" => "H",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              13 => {"7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              14 => {"7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              15 => {"7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              16 => {"7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"}}

soft_table = { 13 => {"2" => "H", "3" => "H", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              14 => {"2" => "H", "3" => "H", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              15 => {"2" => "H", "3" => "H", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              16 => {"2" => "H", "3" => "H", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              17 => {"2" => "Dh", "3" => "Dh", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                    "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
              18 => {"3" => "Ds", "4" => "Ds", "5" => "Ds", "6" => "Ds", "9" => "H", "10" => "H"},
              19 => {"6" => "Dh"}}

paired_table = {2 => {"8" => "H", "9" => "H", "10" => "H", "A" => "H"},
                3 => {"9" => "H", "10" => "H", "A" => "H"},
                4 => {"2" => "H", "3" => "H", "7" => "H", "8" => "H", "9" => "H", "10" => "H", "A" => "H"},
                5 => {"2" => "Dh", "3" => "Dh", "4" => "Dh", "5" => "Dh", "6" => "Dh",
                      "7" => "Dh", "8" => "Dh", "9" => "Dh", "10" => "H", "A" => "H"},
                6 => {"8" => "H", "9" => "H", "10" => "H", "A" => "H"},
                7 => {"9" => "H", "10" => "S", "A" => "H"},
                9 => {"7" => "S", "10" => "S", "A" => "S"},
                10 => "2" => "S", "3" => "S", "4" => "S", "5" => "S", "6" => "S",
                      "7" => "S", "8" => "S", "9" => "S", "10" => "S", "A" => "S"}
                }

def is_integer?(value)
  return value.to_i.to_s == value.to_s
end

def get_hand_value(card1, card2)
  if is_integer?(card1)
    temp_card1 = card1.to_i
  else
    temp_card1 = get_card_value(card1)
  end
  if is_integer?(card2)
    temp_card2 = card2.to_i
  else
    temp_card2 = get_card_value(card2)
  end
  return temp_card1 + temp_card2
end

def get_card_value(card1)
  if is_integer?(card1)
    return card1.to_i
  end
  if is_integer?(card_values[card1.to_s])
    return card_values[card1.to_s]
  else
    #works only for normal, will have to change this for nightmare
    return card_values[card1.to_s][1]
  end
end

def get_card_input(string)
  puts "Enter value for #{string} card: "
  temp = gets.chomp
  if is_integer?(temp) && (temp.to_i >=2 && temp.to_i <= 10)
    return temp
  elsif cards[temp]
    return temp
  else
    puts "Please enter an actual card value, and remember use a number or respond with"
    puts "J for Jack, Q for Queen, K for King or A for Ace."
    return get_card_input(string)
  end
end

#set defaults for each Hash
cards.default = 0
hard_table.default = "S"
soft_table.default = "S"
paired_table.default = "P"
puts "I will be asking for your blackjack hand first one card at a time and then the dealers card."
puts "Please respond with the number or for face cards enter J for Jack, Q for Queen, K for King or A for Ace."
card1 = get_card_input("first")
card2 = get_card_input("second")
dealer = get_card_input("dealers")

puts "card 1 = #{card1}, card 2 = #{card2}, dealers card = #{dealer}"
