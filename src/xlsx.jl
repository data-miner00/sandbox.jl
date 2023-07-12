using XLSX
using DataFrames


# Write to excel
df = DataFrame(
    order_id=1:3,
    product=["keyboard", "small, gaming mouse", "cup"],
    price=[15.5, 22.1, 4.99])

XLSX.writetable("data/orders.xlsx", df)

# Read from excel
excel = XLSX.readxlsx("data/orders.xlsx")
excel["Sheet1"]
excel["Sheet1"]["C1:C4"]

# Import to DataFrame
table = XLSX.readtable("data/orders.xlsx", "Sheet1")
df = DataFrame(table)


# Detailed new excel file
XLSX.openxlsx("data/more_orders.xlsx", mode="w") do file
    first_sheet = file[1]
    XLSX.rename!(first_sheet, "Message")
    first_sheet["A1"] = "Add comments here"

    second_sheet = XLSX.addsheet!(file, "Data")
    second_sheet["B1"] = [ "Name" "Order Id" "Status" ;
                           "John" 1 "paid" ;
                           "Mary" 3 "shipped" ]
end
