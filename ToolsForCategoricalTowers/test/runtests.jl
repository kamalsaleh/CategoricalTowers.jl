# set warn_overwrite to 0
opts = Base.JLOptions()
opts_dict = Dict(key=>getfield(opts, key) for key ∈ fieldnames(Base.JLOptions))
opts_dict[:warn_overwrite] = 0
new_opts = Base.JLOptions(getindex.(Ref(opts_dict), Symbol.(fieldnames(Base.JLOptions)))...)
unsafe_store!(Base.cglobal(:jl_options, Base.JLOptions), new_opts)

using Documenter, Test
using ToolsForCategoricalTowers

# use r"\s+" => "" to ignore whitespaces
# fix=true to overwrite the output strings
doctest(ToolsForCategoricalTowers; doctestfilters=[r"\s+" => ""], fix=false)