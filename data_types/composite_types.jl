struct Archer
    name::String
    health::Int
    arrows::Int
end

if abspath(PROGRAM_FILE) == @__FILE__
    robin = Archer("Robin Hood", 30, 24)
    println(typeof(robin))
    println(robin)
end