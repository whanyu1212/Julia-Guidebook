roman_numerals = Dict('I' => 1, 'X' => 10, 'C' => 100,
    'V' => 5, 'L' => 50, 'D' => 500,
    'M' => 1000)

if abspath(PROGRAM_FILE) == @__FILE__
    println(get(roman_numerals, 'z', -1))
    println(haskey(roman_numerals, 'z'))
end