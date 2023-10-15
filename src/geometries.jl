export Ellipse,Rectangle,Translation,Rotation,Geometry,Circle
abstract type Geometry end

"""
    Circle(radius,pos)
A circular shape
# Attributes
* `radius` : radius in nm 
* `pos` : [x,y] position of origin in nm 
"""
function Circle(radius::Real,pos::Array{Real,1})
    return Translation(Ellipse([radius,radius]),pos)
end
"""
    Circle(radius)
A circular shape around the origin
# Attributes
* `radius` : radius in nm 
"""
function Circle(radius::Real)
    return Ellipse([radius,radius])
end
"""
    Ellipse(radius)
An elliptical shape around the origin
# Attributes
* `radius` : [x,y] radius in nm 
"""
struct Ellipse<:Geometry
    radius::Array{Real,1}
end
"""
    Ellipse(radius,pos)
An elliptical shape
# Attributes
* `radius` : [x,y] radius in nm 
* `pos` : [x,y] position of origin in nm 
"""
function Ellipse(radius::Array{Real,1},pos::Array{Real,1})
    return Translation(Ellipse(radius))
end

"""
    Rectangle(size,pos)
A rectangular shape around the origin
# Attributes
* `size` : [x,y] size in nm 
"""
struct Rectangle <: Geometry
    size::Array{Real,1}
end
"""
    Rectangle(size)
A rectangular shape
# Attributes
* `size` : [x,y] size in nm 
* `pos` : [x,y] position of origin in nm 
"""
function Rectangle(size::Array{Real,1},pos::Array{Real,1})
    return Translation(Rectangle(size),pos)
end

"""
    Translation(G,pos)
A geometry object for the description of the shift of another geometry object G by 2D vector pos
# Attributes
* `G` : Geometry to rotate
* `pos` : [x,y] vector of translation of origin in nm 
"""
struct Translation<: Geometry
    G::Geometry
    pos::Array{Real,1}
end
"""
    Rotation(G,θ)
A geometry object for the description of the rotation of another geometry object G by the angle θ
# Attributes
* `G` : Rotated geometry
* `θ` : Rotation angle
"""
struct Rotation <: Geometry
    G::Geometry
    θ::Real
end   
