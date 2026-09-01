function (F::IsObjectInPreSheafCategory.abstract_type)(c::IsCapCategoryCell.abstract_type)
    CallFuncList(F, [c])
end

function (F::IsMorphismInPreSheafCategory.abstract_type)(c::IsCapCategoryObject.abstract_type)
    CallFuncList(F, [c])
end
