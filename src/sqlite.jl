using SQLite
using DataFrames

db = SQLite.DB("data/some.db")

DBInterface.execute(db, "CREATE TABLE person(id INTEGER, name TEXT);")

ids = [1, 2, 55]
names = ["Jane", "Pete", "Derek"]

# SQL inject
DBInterface.execute(db, "INSERT INTO person VALUES($(ids[1]), '$(names[1])');")

# Safe equivalent
insert = DBInterface.prepare(db, "INSERT INTO person VALUES(?, ?);")
DBInterface.execute(insert, (ids[1], names[1]))
DBInterface.executemany(insert, (ids[2:3], names[2:3]))

# Read from db
all_rows = DBInterface.execute(db, "SELECT * FROM person;")

for row in all_rows
    # Access by column Id
    println(row[1])
    # Access by column name
    println(row.name)
end


# Turn into DataFrame
df = DataFrame(all_rows)

# close the db
DBInterface.close!(db)
