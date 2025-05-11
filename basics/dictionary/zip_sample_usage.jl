number_str = ["one", "two", "three"]
number_int = [1, 2, 3]

if abspath(PROGRAM_FILE) == @__FILE__
    print(Dict(zip(number_str, number_int)))
end