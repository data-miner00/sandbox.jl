using JSON

dict = Dict("key_1" => "value_1", "key_2" => "value_2")

dict["key_2"] = "valval2"

dict |> json |> println

# With indentation of 4 spaces
json(dict, 4) |> println

# Parse Json string to Dictionary
initial_state = """
{
    "people": [
        {
            "name": "Jane",
            "age": 63
        },
        {
            "name": "Pete",
            "age": 55
        }
    ]
}
"""

people = JSON.parse(initial_state)

people["people"][2]["age"] |> println

# Add new person
new_person = Dict("name" => "Derek", "age" => 32)
push!(people["people"], new_person)

open("data/people.json", "w") do file
    write(file, json(people))
end
