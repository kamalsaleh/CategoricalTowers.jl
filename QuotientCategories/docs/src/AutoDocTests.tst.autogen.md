
```jldoctest AutoDocTests
julia> using CAP, ToolsForCategoricalTowers, MatricesForHomalg, AdditiveClosuresForCAP, FreydCategoriesForCAP, QuotientCategories

julia> true
true

julia> true
true

julia> zz = HomalgRingOfIntegers( );

julia> rows_zz = CategoryOfRows( zz )
Rows( Z )

julia> A_rows_zz = FreydCategory( rows_zz )
Freyd( Rows( Z ) )

julia> congruence_func = phi -> IsLiftable( phi, EpimorphismFromSomeProjectiveObject( Target( phi ) ) );

julia> quotient_cat = QuotientCategory( @rec( underlying_category = A_rows_zz, congruence_func = congruence_func, nr_arguments_of_congruence_func = 1 ) )
QuotientCategory( Freyd( Rows( Z ) ), congruence_func )

julia> Display( quotient_cat )
A CAP category with name QuotientCategory( Freyd( Rows( Z ) ), congruence_func ):

34 primitive operations were used to derive 144 operations for this category which algorithmically
* IsLinearCategoryOverCommutativeRing
* IsAdditiveCategory 

julia> m = HomalgMatrix( [ [ -2, 0, 0, -1 ], [ 8, 0, 0, 4 ], [ -43, 2, 1, -17 ], [ 6, 0, 0, 3 ] ], 4, 4, zz );

julia> M = m / rows_zz / A_rows_zz
<An object in Freyd( Rows( Z ) )>

julia> IsProjective( M )
true

julia> quotient_M = M / quotient_cat;

julia> IsZeroForObjects( quotient_M )
true

```
