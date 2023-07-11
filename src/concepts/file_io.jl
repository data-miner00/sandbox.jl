file_path = "src/concepts/sample.txt"
new_file = "src/concepts/new.txt"

function readTextFile()
    file::IOStream = open(file_path)
    read(file, String) |> println
    close(file)
end

function writeTextFile()
    file::IOStream = open(file_path, "w")
    write(file, "Content to be written")
    close(file)
end

function readTextFileWithDo()
    open(file_path) do file
        read(file, String) |> println
    end
end

function writeManyLines()
    open(new_file, "w") do file
        for id in 1:100000
            write(file, "order id=$id\n")
            write(file, "amount=$(rand(1:100))\n")
        end
    end
end

function readEachLines()
    total = 0
    open(new_file) do file
        for line in eachline(file)
            if startswith(line, "amount")
                total += 1
            end
        end
    end
    total
end

function readAllLines()
    total = 0
    open(new_file) do file
        for line in readlines(file)
            if startswith(line, "amount")
                total += 1
            end
        end
    end
    total
end


using BenchmarkTools

@btime readEachLines()
@btime readAllLines()
