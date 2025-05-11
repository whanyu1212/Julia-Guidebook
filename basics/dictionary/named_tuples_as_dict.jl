# The benefit of any tuple type over an array or a dictionary is that the Julia JIT compiler
# will know exactly which elements will be in the tuple at any given time, which
# allows for more aggressive optimizations.

# named tuple instead of dict
# immutable version of dict
roman_numerals = (I=1, X=10, C=100,
    V=5, L=50, D=500,
    M=1000)

function parse_roman(s)
    s = reverse(uppercase(s))
    # named tuples use symbols instead of keys
    vals = [roman_numerals[Symbol(ch)] for ch in s]
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
    println(roman_numerals[:I]) #'I' will not work
    println(roman_numerals.I)
    println(parse_roman("IV"))
end