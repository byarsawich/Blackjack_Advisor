def is_integer?(value)
  return value.to_i.to_s == value.to_s
end

def get_card_input_player(string, card_values)
  puts "Enter value for #{string} card: "
  temp = gets.chomp.upcase
  if is_integer?(temp) && (temp.to_i >=2 && temp.to_i <= 10)
    return temp.to_i
  elsif card_values[temp]
    return card_values[temp].to_i
  else
    puts "Please enter an actual card value, and remember use a number or respond with"
    puts "J for Jack, Q for Queen, K for King or A for Ace."
    return get_card_input(string)
  end
end

def get_card_input_dealer(card_values, ace)
  puts "Enter value for dealers card: "
  temp = gets.chomp.upcase
  if is_integer?(temp) && (temp.to_i >=2 && temp.to_i <= 10)
    return temp.to_s
  elsif card_values[temp] == ace
    return "A"
  elsif card_values[temp]
    return card_values[temp].to_s
  else
    puts "Please enter an actual card value, and remember use a number or respond with"
    puts "J for Jack, Q for Queen, K for King or A for Ace."
    return get_card_input(string)
  end
end

def get_hash_value(hash, index1, index2)
  if hash[index1][index2]
    return hash[index1][index2]
  else
    return hash.default
  end
end

def show_best_move(move)
  best_moves_key = {"S" => "Stand", "H" => "Hit", "P" => "Split",
                    "Dh" => "Double if possible, otherwise Hit", "Ds" => "Double if possible, otherwise Stand"}
  puts "Your best move is to #{best_moves_key[move]}"
end

def get_deck_input
  puts "Today are we playing with 1, 2 or 4 decks: "
  temp = gets.chomp
  if is_integer?(temp)
    temp = temp.to_i
    if temp == 1 || temp == 2 || temp == 4
      return temp
    else
      puts "Please enter only a 1, a 2, or a 4 for number of decks."
      return get_deck_input
    end
  else
    puts "Please enter a number for the number of decks."
    sleep 1
    puts "Idiot"
    return get_deck_input
  end
end

card_values = {"J" => "10", "Q" => "10", "K" => "10", "A" => "11"}
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

soft_table = {13 => {"2" => "H", "3" => "H", "4" => "Dh", "5" => "Dh", "6" => "Dh",
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
                10 => {"2" => "S", "3" => "S", "4" => "S", "5" => "S", "6" => "S",
                      "7" => "S", "8" => "S", "9" => "S", "10" => "S", "A" => "S"}}

hard_table_2_decks = {8 => {"5" => "H", "6" => "H"}}

soft_table_2_decks = {13 => {"4" => "H"},
                      14 => {"4" => "H"},
                      17 => {"2" => "H"},
                      18 => {"A" => "H"},
                      19 => {"6" => "S"}}

paired_table_2_decks = {3 => {"8" => "H"},
                        4 => {"4" => "H"},
                        7 => {"10" => "H"}}

hard_table_4_decks = {8 => {"5" => "H", "6" => "H"},
                      9 => {"2" => "H"},
                      11 => {"A" => "H"}}

soft_table_4_decks = {13 => {"4" => "H"},
                      14 => {"4" => "H"},
                      17 => {"2" => "H"},
                      18 => {"A" => "H"},
                      19 => {"6" => "S"}}

paired_table_4_decks = {3 => {"8" => "H"},
                        4 => {"4" => "H"},
                        7 => {"8" => "H", "10" => "H"}}

ACE = 11
#set defaults for each Hash
hard_table.default = "S"
soft_table.default = "S"
paired_table.default = "P"
deck_count = get_deck_input

puts "I will be asking for your blackjack hand first one card at a time and then the dealers card."
puts "Please respond with the number or for face cards enter J for Jack, Q for Queen, K for King or A for Ace."
card1 = get_card_input_player("first", card_values)
card2 = get_card_input_player("second", card_values)
dealer = get_card_input_dealer(card_values, ACE)
#this is prety bad, but i did not want to go through and change the "A"s in the hash to 11
dealer = "A" if dealer.to_i == ACE
#puts "Key: H = Hit, S = Stand, P = Split, Dh = double if you can or hold, Ds = double if you can or stand"

if card1 == card2
  show_best_move(get_hash_value(paired_table, card1, dealer))
elsif card1 == ACE || card2 == ACE
  show_best_move(get_hash_value(soft_table, card1 + card2, dealer))
else
  show_best_move(get_hash_value(hard_table, card1 + card2,dealer))
end
