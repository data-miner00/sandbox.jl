# Shell mode is not working nicely on Windows
# see: https://github.com/JuliaLang/julia/issues/23597

# Define a command, must be enclosed in backticks
`ls`
typeof(`ls`)

# Define a command with args
# store command in variable
folder_content = Cmd(`ls`, dir="data")

# Piped commands
sorted_files = pipeline(folder_content, `sort`)
top_sorted_files = pipeline(folder_content, `sort`, `head -n 3`)
save_sorted_files = pipeline(sorted_files, "data/out.txt")

# Execute the commands while ignoring output
run(`ls`)
run(folder_content)

# Store the output
files = read(`ls`, String)
split(files)
