
using HTTP
using JSON

function fetch_capital_cities()
    response = HTTP.get("https://restcountries.com/v3.1/all")
    data = JSON.parse(String(response.body))

    capitals = filter(x -> haskey(x, "capital"), data)
    capital_cities = [country["capital"] for country in capitals]

    return capital_cities
end

capitals = fetch_capital_cities()

# Gib die ersten 10 Hauptstädte aus
println(capitals)

