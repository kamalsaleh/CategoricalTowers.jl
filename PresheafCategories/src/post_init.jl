function (F::IsObjectInPreSheafCategory.abstract_type)(c::IsCapCategoryCell.abstract_type)
    CallFuncList(F, [c])
end

function (F::IsMorphismInPreSheafCategory.abstract_type)(c::IsCapCategoryObject.abstract_type)
    CallFuncList(F, [c])
end

# NEVER COMMIT THIS: MOVE TO CAP.jl (or ToolsForCategoricalTowers.jl where CallFuncList is installed)
function (F::IsCapFunctor.abstract_type)(c::IsCapCategoryCell.abstract_type)
    CallFuncList(F, [c])
end

function (F::IsCapNaturalTransformation.abstract_type)(c::IsCapCategoryObject.abstract_type)
    CallFuncList(F, [c])
end
###################################