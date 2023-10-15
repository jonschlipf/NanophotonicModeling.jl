
export Layer,PlainLayer,PatternedLayer,Inclusion,PeriodicLayerModel
abstract type Layer end

struct Inclusion
    material::String
    geometry::Geometry
end
struct PlainLayer<:Layer
    thickness::Real
    material::String
end

struct PatternedLayer<:Layer
    thickness::Real
    material::String
    inclusions::Array{Inclusion,1}
end

struct PeriodicLayerModel
    layers::Array{Layer,1}
    sup::String
    sub::String
    xy_size::Array{Real,1}
end

