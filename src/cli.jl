using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
    
    "--display", "-d"
    help = "display data"
    arg_type = Bool
    default = false

    "--plot", "-p"
    help = "plots data"
    arg_type = Bool
    default = false

    "path"
    help = "path to data file"
    required = true

    end

    return parse_args(s)
end

function main()
    parsed_args = parse_commandline()

    display(parsed_args)

    if parsed_args["display"] == true
        println("Display called")
    elseif parsed_args["plot"] == true
        println("Plot called")
    end

    println("Program done")
end

main()
