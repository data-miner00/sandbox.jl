using HTTP
using JSON
using DataFrames


function call(url::String)
    try
        res = HTTP.get(url)
        JSON.parse(String(res.body))
    catch e
        return "Error: $e"
    end
end

function main()
    url = "https://cat-fact.herokuapp.com/facts"

    r = call(url)

    df = DataFrame(r)

    show(df)

    println(r)
end

main()
