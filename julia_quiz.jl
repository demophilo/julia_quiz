
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


capitals = fetch_capital_cities()



