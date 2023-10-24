
export Layer,PlainLayer,PatternedLayer,Inclusion,PeriodicLayerModel
abstract type Layer end

"""
    Inclusion(material,geometry)
An inclusion (e.g. circular hole) in a layer
# Attributes
* `material` : String denoting the material 
* `geometry` : geometric shape of the inclusion 
"""
struct Inclusion
    material::String
    geometry::Geometry
end
"""
    PlainLayer(thickness,material)
A plain layer without inclusions
# Attributes
* `thickness` : thickness in nm
* `material` : String denoting the material 
"""

struct PlainLayer<:Layer
    thickness::Real
    material::String
end

"""
    PatternedLayer(thickness,material,inclusions)
A layer with inclusions
# Attributes
* `thickness` : thickness in nm
* `material` : String denoting the material 
* `inclusions` : Array of structs that describe the inclusions 
"""
struct PatternedLayer<:Layer
    thickness::Real
    material::String
    inclusions::Array{Inclusion,1}
end

"""
    PeriodicLayerModel(layers,sup,sub,xy_size)
A model describing a periodic multilayer by its unit cell
# Attributes
* `layers` : Array of the layers involved 
* `sup` : String denoting superstrate material 
* `sub` : String denoting substrate material 
* `xy_size` : array denoting the unit cell size in nm 
"""
struct PeriodicLayerModel
    layers::Array{Layer,1}
    sup::String
    sub::String
    xy_size::Array{Real,1}
end

