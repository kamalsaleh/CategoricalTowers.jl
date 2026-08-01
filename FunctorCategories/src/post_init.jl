empty!(ExcludedNames)

function CreateBouquet( n::Int, loops::Vector{Int} )
    return CreateBouquet( BigInt( n ), BigInt.( loops ) )
end

function CreateBouquet(
        category_of_bouquets::TheJuliaAbstractTypeIsCategoryOfBouquets,
        n::Int,
        loops::Vector{Int} )
    return CreateBouquet( category_of_bouquets, BigInt( n ), BigInt.( loops ) )
end

function CreateBouquetMorphism(
	source::TheJuliaAbstractTypeIsObjectInCategoryOfBouquets,
	images_of_vertices::Vector{Int},
	images_of_loops::Vector{Int},
	range::TheJuliaAbstractTypeIsObjectInCategoryOfBouquets )
	return CreateBouquetMorphism( source,
				BigInt.( images_of_vertices ),
				BigInt.( images_of_loops ),
				range )
end
