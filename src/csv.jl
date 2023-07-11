
using DataFrames

df = DataFrame(
    order_id=1:3,
    product=["keyboard", "small, gaming mouse", "cup"],
    price=[15.5, 22.1, 4.99])

df.product

using CSV

CSV.write("data/new_orders.csv", df)

order_df = CSV.read("data/new_orders.csv", DataFrame)

df == order_df
