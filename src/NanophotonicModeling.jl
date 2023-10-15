module NanophotonicModeling
export build_model
include("geometries.jl")
include("layers.jl")
function build_model(mdl::PeriodicLayerModel)
    println("No solver available")
end

end # module NanophotonicModeling
