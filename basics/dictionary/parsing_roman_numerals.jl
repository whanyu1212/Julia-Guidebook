roman_numerals = Dict('I' => 1, 'X' => 10, 'C' => 100,
    'V' => 5, 'L' => 50, 'D' => 500,
    'M' => 1000)

function parse_roman(s::String)::Int
    s = reverse(uppercase(s))
    vals = [roman_numerals[ch] for ch in s]
    result = 0
    for (i, val) in enumerate(vals)
        if i > 1 && val < vals[i-1]
            result -= val
        else
            result += val
        end
    end
    result
end

if abspath(PROGRAM_FILE) == @__FILE__
    println(parse_roman("IV"))
end