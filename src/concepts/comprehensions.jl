# Array Comprehension
# - Store values in advance
# - Problematic for huge arrays
products = ["table", "chair", "cup"]

# add prefix to each products
updated_products = String[]
for p in products
    push!(updated_products, "One " * p)
end

# better equivalence
updated_products - ["One " * p for p in products]

# use vectorization
updated_products = "One " .* products

updated_filtered_products = ["One " * p for p in products if length(p) > 3]

# Generator Comprehension
# - Generates values lazily
# - Great for huge arrays

updated_filtered_products_lazy = ("One " * p for p in products if length(p) > 3)

# convert generator into array
updated_filtered_products = collect(updated_filtered_products_lazy)
