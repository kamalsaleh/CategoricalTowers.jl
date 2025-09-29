
```jldoctest
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> ReadPackage( "Algebroids", "tst/derive_second_projection_of_ternary_direct_sum_from_universal_morphism.g" );
function ( dummy_1, a_dummy_1, b_dummy_1, c_dummy_1, abc_dummy_1 )
    return UniversalMorphismFromDirectSumWithGivenDirectSum( dummy_1, 
       [ a_dummy_1, b_dummy_1, c_dummy_1 ], b_dummy_1, 
       [ ZeroMorphism( dummy_1, a_dummy_1, b_dummy_1 ), 
          IdentityMorphism( dummy_1, b_dummy_1 ), 
          ZeroMorphism( dummy_1, c_dummy_1, b_dummy_1 ) ], abc_dummy_1 )
end

```
