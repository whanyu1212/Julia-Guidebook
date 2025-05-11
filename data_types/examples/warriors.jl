abstract type Warrior end # no constructor defined for warrior so you cant do Warrior()

mutable struct Archer <: Warrior
    name::String
    health::Int
    arrows::Int
end
mutable struct Pikeman <: Warrior
    name::String
    health::Int
end
mutable struct Knight <: Warrior
    name::String
    health::Int
    mounted::Bool
end

function shoot!(archer::Archer)
    if archer.arrows > 0
        archer.arrows -= 1
    end
    archer
end

function resupply!(archer::Archer)
    archer.arrows = 24
    archer
end

function mount!(knight::Knight)
    knight.mounted = true
end

function dismount!(k::Knight)
    knight.mounted = false
end

function attack!(a::Archer, b::Archer)
    if a.arrows > 0
        shoot!(a)
        damage = 6 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end

function attack!(a::Archer, b::Knight)
    if a.arrows > 0
        shoot!(a)
        damage = rand(1:6)
        if b.mounted
            damage += 3
        end
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end

function attack!(a::Knight, b::Knight)
    a.health = max(a.health - rand(1:6), 0)
    b.health = max(b.health - rand(1:6), 0)
    a.health, b.health
end

function attack!(a::Archer, b::Pikeman)
    if a.arrows > 0
        shoot!(a)
        damage = 4 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end


if abspath(PROGRAM_FILE) == @__FILE__
    robin = Archer("Robin Hood", 34, 24)
    white = Knight("Lancelot", 34, true)
    willian = Archer("William Tell", 30, 20)
    println(attack!(willian, robin))
    println(attack!(robin, white))
end