function ObjectConstructor(sFinSets::IsSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory.abstract_type, n::Int64)
    ObjectConstructor(sFinSets, BigInt(n))
end

function MorphismConstructor(source::IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory.abstract_type, map::Vector{Int64}, range::IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory.abstract_type)
    MorphismConstructor(source, Vector{BigInt}(map), range)
end
