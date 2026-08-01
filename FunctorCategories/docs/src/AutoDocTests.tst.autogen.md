
```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> FinBouquets
FinBouquets

julia> C = UnderlyingCategory( FinBouquets )
PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) )

julia> P = FinBouquets.P
<An object in FinBouquets>

julia> Display( P )
( [ 0 ], [ ] )

julia> L = FinBouquets.L
<An object in FinBouquets>

julia> Display( L )
( [ 0 ], [ 0 ↦ 0 ] )

julia> b = FinBouquets.b
<A morphism in FinBouquets>

julia> Display( b )
Image of <(P)>:
[ 0 ] ⱶ[ 0 ]→ [ 0 ]

Image of <(L)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinBouquets
given by the above data

julia> T = TerminalObject( FinBouquets )
<An object in FinBouquets>

julia> Display( T )
( [ 0 ], [ 0 ↦ 0 ] )

julia> T == L
true

julia> M = CreateBouquet( 3, [ 1, 1, 1, 2 ] )
<An object in FinBouquets>

julia> Display( M )
( [ 0, 1, 2 ], [ 0 ↦ 1, 1 ↦ 1, 2 ↦ 1, 3 ↦ 2 ] )

julia> N = Colimit( [ P, P, P, L, L, L, L ],
                     [ [ 1, b, 3 ],
                       [ 1, b, 4 ],
                       [ 1, b, 5 ],
                       [ 2, b, 6 ] ] )
<An object in FinBouquets>

julia> N == M
true

julia> LL = Coproduct( L, L )
<An object in FinBouquets>

julia> L2 = CreateBouquet( 1, [ 0, 0 ] )
<An object in FinBouquets>

julia> epsilon = CreateBouquetMorphism( LL, [ 0, 0 ], [ 0, 1 ], L2 )
<A morphism in FinBouquets>

julia> IsWellDefined( epsilon )
true

julia> IsEpimorphism( epsilon )
true

julia> IsSplitEpimorphism( epsilon )
false

julia> omega = SubobjectClassifier( FinBouquets )
<An object in FinBouquets>

julia> Display( omega )
( [ 0, 1 ], [ 0 ↦ 0, 1 ↦ 1, 2 ↦ 1 ] )

julia> PM = PowerObject( M )
<An object in FinBouquets>

julia> Display( PM )
( [ 0,..., 7 ],
  [ 0 ↦ 0, 1 ↦ 1, 2 ↦ 2, 3 ↦ 3, 4 ↦ 2, 5 ↦ 3,
    6 ↦ 2, 7 ↦ 3, 8 ↦ 2, 9 ↦ 3, 10 ↦ 2, 11 ↦ 3,
    12 ↦ 2, 13 ↦ 3, 14 ↦ 2, 15 ↦ 3, 16 ↦ 2, 17 ↦ 3,
    18 ↦ 4, 19 ↦ 5, 20 ↦ 6, 21 ↦ 7, 22 ↦ 6, 23 ↦ 7,
    24 ↦ 6, 25 ↦ 7, 26 ↦ 6, 27 ↦ 7, 28 ↦ 6, 29 ↦ 7,
    30 ↦ 6, 31 ↦ 7, 32 ↦ 6, 33 ↦ 7, 34 ↦ 6, 35 ↦ 7,
    36 ↦ 4, 37 ↦ 5, 38 ↦ 6, 39 ↦ 7, 40 ↦ 6, 41 ↦ 7,
    42 ↦ 6, 43 ↦ 7, 44 ↦ 6, 45 ↦ 7, 46 ↦ 6, 47 ↦ 7,
    48 ↦ 6, 49 ↦ 7, 50 ↦ 6, 51 ↦ 7, 52 ↦ 6, 53 ↦ 7 ] )

julia> # @Xrop_example_in_Julia

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> true
true

julia> FinQuivers
FinQuivers

julia> decorating_quiver = SubobjectClassifier( FinQuivers )
<An object in FinQuivers>

julia> Display( decorating_quiver )
( [ 0, 1 ],
  [ 0 = [ 0, 0 ], 1 = [ 1, 0 ], 2 = [ 0, 1 ],
    3 = [ 1, 1 ], 4 = [ 1, 1 ] ] )

julia> DecoratedFinQuivers =
          CategoryOfDecoratedQuivers( decorating_quiver,
                  [ "magenta", "cyan" ],
                  [ "red", "brown", "orange", "blue", "green" ] )
CategoryOfDecoratedQuivers( decorating_quiver )

julia> B = TerminalObject( DecoratedFinQuivers )
<An object in CategoryOfDecoratedQuivers( decorating_quiver )>

julia> Display( B )
( [ 0 = "magenta", 1 = "cyan" ],
  [ 0 = [ 0, 0, "red" ], 1 = [ 1, 0, "brown" ], 2 = [ 0, 1, "orange" ],
    3 = [ 1, 1, "blue" ], 4 = [ 1, 1, "green" ] ] )

julia> iota = Subobject( B, [ 0 ], [ 3, 4 ] )
<A morphism in CategoryOfDecoratedQuivers( decorating_quiver )>

julia> Display( iota )
Image of <(V)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(A)>:
[ 0, 1 ] ⱶ[ 3, 4 ]→ [ 0,..., 4 ]

A morphism in CategoryOfDecoratedQuivers( decorating_quiver )
given by the above data

julia> dq1 = CreateDecoratedQuiver( DecoratedFinQuivers,
                       [ 0, 1, 1, 1 ], # decoration of [ 0, 1, 2, 3 ]
                       [ 0,0,0,  0,1,2,  1,0,1,  1,2,3,  2,3,4,  3,2,3 ] )
<An object in CategoryOfDecoratedQuivers( decorating_quiver )>

julia> Display( dq1 )
( [ 0 = "magenta", 1 = "cyan", 2 = "cyan", 3 = "cyan" ],
  [ 0 = [ 0, 0, "red" ], 1 = [ 0, 1, "orange" ], 2 = [ 1, 0, "brown" ],
    3 = [ 1, 2, "blue" ], 4 = [ 2, 3, "green" ], 5 = [ 3, 2, "blue" ] ] )

julia> IsWellDefined( dq1 )
true

julia> omega = SubobjectClassifier( DecoratedFinQuivers )
<An object in CategoryOfDecoratedQuivers( decorating_quiver )>

julia> Display( omega )
( [ 0 = "magenta", 1 = "magenta", 2 = "cyan", 3 = "cyan" ],
  [ 0 = [ 0, 0, "red" ], 1 = [ 1, 0, "red" ], 2 = [ 0, 1, "red" ],
    3 = [ 1, 1, "red" ], 4 = [ 1, 1, "red" ], 5 = [ 2, 0, "brown" ],
    6 = [ 3, 0, "brown" ], 7 = [ 2, 1, "brown" ], 8 = [ 3, 1, "brown" ],
    9 = [ 3, 1, "brown" ], 10 = [ 0, 2, "orange" ], 11 = [ 1, 2, "orange" ],
    12 = [ 0, 3, "orange" ], 13 = [ 1, 3, "orange" ], 14 = [ 1, 3, "orange" ],
    15 = [ 2, 2, "blue" ], 16 = [ 3, 2, "blue" ], 17 = [ 2, 3, "blue" ],
    18 = [ 3, 3, "blue" ], 19 = [ 3, 3, "blue" ], 20 = [ 2, 2, "green" ],
    21 = [ 3, 2, "green" ], 22 = [ 2, 3, "green" ], 23 = [ 3, 3, "green" ],
    24 = [ 3, 3, "green" ] ] )

julia> # @xrop_example_in_Julia

```
