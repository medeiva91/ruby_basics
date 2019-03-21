alphabet = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
vowels = "аеёиоуыэюя"
hash_vowels = {}

vowels.each_char do |vowel|
  index = alphabet.index(vowel)
  hash_vowels[vowel] = index + 1
end
puts hash_vowels
