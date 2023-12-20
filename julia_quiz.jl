
using HTTP
using JSON

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
    return 'a' <= letter <= 'z' || 'A' <= letter <= 'Z' || letter in 'ÄÖÜäöüß'
end

function input_letter()
    while is_german_letter(letter) == false && length(letter) != 1
        letter = NaN
        println("Input single letter:")
        letter = readline() 
    end
    return letter
end


capitals = fetch_capital_cities()

word_to_guess = get_random_item(capitals)

println(word_to_guess)

characters_to_guess = Set(collect(word_to_guess))
guessed_character = readline()
println(guessed_character)
println(characters_to_guess)
