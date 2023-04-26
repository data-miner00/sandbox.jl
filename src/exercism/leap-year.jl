function is_leap_year(year)
    is_divisible_by_four = year % 4 == 0
    is_divisible_by_hundred = year % 100 == 0
    is_divisible_by_four_hundred = year % 400 == 0
    return is_divisible_by_four && (!is_divisible_by_hundred || is_divisible_by_four_hundred)
end