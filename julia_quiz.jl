
using HTTP
using JSON

possible_letters = Set(['a':'z'..., 'A':'Z'..., 'Ä', 'Ö', 'Ü', 'ä', 'ö', 'ü', 'ß'])

function fetch_capital_cities()
    response = HTTP.get("https://restcountries.com/v3.1/all")
    data = JSON.parse(String(response.body))

    capitals = filter(x -> haskey(x, "capital"), data)
    capital_cities = [String(country["capital"][1]) for country in capitals]

    return capital_cities
end

function get_random_item(array)
    random_index = rand(1:length(array))
    return array[random_index]
end

function is_german_letter(letter::Char)
    return letter in possible_letters
end




capitals = fetch_capital_cities()

word_to_guess = get_random_item(capitals)


guessed_letters = Set()
characters_to_guess = Set(collect(word_to_guess))
right_characters = intersect(characters_to_guess, guessed_letters)
wrong_characters = setdiff(guessed_letters, characters_to_guess)

println(word_to_guess)


guessed_character = readline()
println(guessed_character)
println(characters_to_guess)
