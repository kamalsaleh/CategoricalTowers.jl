
```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> Delta2 = SimplicialCategoryTruncatedInDegree( 2 )
PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ]

julia> DefiningRelations( Delta2 )
[ [ s⋅id:(C0) → (C0), id(C0):(C0) → (C0) ],
  [ t⋅id:(C0) → (C0), id(C0):(C0) → (C0) ],
  [ ps⋅is:(C1) → (C1), id(C1):(C1) → (C1) ],
  [ pt⋅it:(C1) → (C1), id(C1):(C1) → (C1) ],
  [ is⋅id:(C2) → (C0), it⋅id:(C2) → (C0) ],
  [ pt⋅is:(C1) → (C1), id⋅t:(C1) → (C1) ],
  [ ps⋅it:(C1) → (C1), id⋅s:(C1) → (C1) ],
  [ s⋅pt:(C0) → (C2), t⋅ps:(C0) → (C2) ],
  [ s⋅mu:(C0) → (C2), s⋅ps:(C0) → (C2) ],
  [ t⋅mu:(C0) → (C2), t⋅pt:(C0) → (C2) ],
  [ mu⋅is:(C1) → (C1), id(C1):(C1) → (C1) ],
  [ mu⋅it:(C1) → (C1), id(C1):(C1) → (C1) ] ]

julia> Size( Delta2 )
31

julia> N = NerveTruncatedInDegree2( Delta2 )
<An object in PreSheaves( PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ],
 SkeletalFinSets )>

julia> IsWellDefined( N )
true

julia> N.C0
|3|

julia> Display( N.C0 )
[ 0, 1, 2 ]

julia> N.C1
|31|

julia> Display( N.C1 )
[ 0,..., 30 ]

julia> N.C2
|393|

julia> Display( N.C2 )
[ 0,..., 392 ]

julia> N.id
|3| → |31|

julia> Display( N.id )
[ 0, 1, 2 ] ⱶ[ 0, 5, 21 ]→ [ 0,..., 30 ]

julia> PSh = CapCategory( N )
<A category in PreSheaves( PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ],
 SkeletalFinSets )>

julia> IntCat = CategoryOfInternalCategories( PSh,
                          RangeCategoryOfHomomorphismStructure( Delta2 ) )
FullSubcategoryByObjectMembershipFunction(
PreSheaves( PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ],
SkeletalFinSets ), ObjectMembershipFunction )

julia> IsWellDefined( N / IntCat )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> C = SimplicialCategoryTruncatedInDegree( 2 )
PathCategory( FinQuiver( "Delta(C0,C1,C2)[id:C1→C0,
s:C0→C1,t:C0→C1,is:C2→C1,it:C2→C1,ps:C1→C2,pt:C1→C2,
mu:C1→C2]" ) ) / [ s⋅id == id(C0), t⋅id == id(C0),
ps⋅is == id(C1), ... ]

julia> Delta2 = CategoryFromNerveData( C )
PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ]

julia> N = NerveTruncatedInDegree2( Delta2 )
<An object in PreSheaves( PathCategory( FinQuiver(
  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
                   is:C2→C1,it:C2→C1,
                   ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0), ps⋅is == id(C1), ... ],
 SkeletalFinSets )>

julia> IsWellDefined( N )
true

julia> N.C0
|3|

julia> Display( N.C0 )
[ 0, 1, 2 ]

julia> N.C1
|31|

julia> Display( N.C1 )
[ 0,..., 30 ]

julia> N.C2
|393|

julia> Display( N.C2 )
[ 0,..., 392 ]

julia> N.id
|3| → |31|

julia> Display( N.id )
[ 0, 1, 2 ] ⱶ[ 0, 5, 21 ]→ [ 0,..., 30 ]

```

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

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> FinQuivers
FinQuivers

julia> V = FinQuivers.V
<An object in FinQuivers>

julia> Display( V )
( [ 0 ], [ ] )

julia> A = FinQuivers.A
<An object in FinQuivers>

julia> Display( A )
( [ 0, 1 ], [ 0 = [ 0, 1 ] ] )

julia> T = TerminalObject( FinQuivers )
<An object in FinQuivers>

julia> Display( T )
( [ 0 ], [ 0 = [ 0, 0 ] ] )

julia> T == V
false

julia> G = CreateQuiver( 3, [ 0,1, 0,1, 1,2, 2,1, 2,2 ] )
<An object in FinQuivers>

julia> Display( G )
( [ 0, 1, 2 ],
  [ 0 = [ 0, 1 ], 1 = [ 0, 1 ], 2 = [ 1, 2 ],
    3 = [ 2, 1 ], 4 = [ 2, 2 ] ] )

julia> global_G = HomStructure( T, G )
|1|

julia> Display( global_G )
[ 0 ]

julia> discrete = DirectProduct( G, V )
<An object in FinQuivers>

julia> Display( discrete )
( [ 0, 1, 2 ], [ ] )

julia> global_discrete = HomStructure( T, discrete )
|0|

julia> Display( global_discrete )
∅

julia> complete = Exponential( V, G )
<An object in FinQuivers>

julia> Display( complete )
( [ 0, 1, 2 ],
  [ 0 = [ 0, 0 ], 1 = [ 1, 0 ], 2 = [ 2, 0 ], 3 = [ 0, 1 ], 4 = [ 1, 1 ],
    5 = [ 2, 1 ], 6 = [ 0, 2 ], 7 = [ 1, 2 ], 8 = [ 2, 2 ] ] )

julia> global_complete = HomStructure( T, complete )
|3|

julia> Display( global_complete )
[ 0, 1, 2 ]

julia> GA = DirectProduct( G, A )
<An object in FinQuivers>

julia> Display( GA )
( [ 0,..., 5 ],
  [ 0 = [ 0, 4 ], 1 = [ 0, 4 ], 2 = [ 1, 5 ],
    3 = [ 2, 4 ], 4 = [ 2, 5 ] ] )

julia> homAG = HomStructure( A, G )
|5|

julia> Display( homAG )
[ 0,..., 4 ]

julia> arrows = Exponential( A, G )
<An object in FinQuivers>

julia> Display( arrows )
( [ 0,..., 8 ],
  [ 0 = [ 0, 3 ], 1 = [ 0, 4 ], 2 = [ 0, 5 ], 3 = [ 3, 3 ], 4 = [ 3, 4 ],
    5 = [ 3, 5 ], 6 = [ 6, 3 ], 7 = [ 6, 4 ], 8 = [ 6, 5 ], 9 = [ 0, 3 ],
    10 = [ 0, 4 ], 11 = [ 0, 5 ], 12 = [ 3, 3 ], 13 = [ 3, 4 ],
    14 = [ 3, 5 ], 15 = [ 6, 3 ], 16 = [ 6, 4 ], 17 = [ 6, 5 ],
    18 = [ 1, 6 ], 19 = [ 1, 7 ], 20 = [ 1, 8 ], 21 = [ 4, 6 ],
    22 = [ 4, 7 ], 23 = [ 4, 8 ], 24 = [ 7, 6 ], 25 = [ 7, 7 ],
    26 = [ 7, 8 ], 27 = [ 2, 3 ], 28 = [ 2, 4 ], 29 = [ 2, 5 ],
    30 = [ 5, 3 ], 31 = [ 5, 4 ], 32 = [ 5, 5 ], 33 = [ 8, 3 ],
    34 = [ 8, 4 ], 35 = [ 8, 5 ], 36 = [ 2, 6 ], 37 = [ 2, 7 ],
    38 = [ 2, 8 ], 39 = [ 5, 6 ], 40 = [ 5, 7 ], 41 = [ 5, 8 ],
    42 = [ 8, 6 ], 43 = [ 8, 7 ], 44 = [ 8, 8 ] ] )

julia> global_arrows = HomStructure( T, arrows )
|5|

julia> Display( global_arrows )
[ 0,..., 4 ]

julia> prjG = ProjectionInFactorOfDirectProduct( [ G, V ], 1 )
<A morphism in FinQuivers>

julia> Display( prjG )
Image of <(V)>:
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0,..., 4 ]

A morphism in FinQuivers
given by the above data

julia> IsEpimorphism( prjG )
false

julia> prj_discrete = ProjectionInFactorOfDirectProduct( [ discrete, V ], 1 )
<A morphism in FinQuivers>

julia> Display( prj_discrete )
Image of <(V)>:
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

Image of <(A)>:
∅ ⱶ[  ]→ ∅

A morphism in FinQuivers
given by the above data

julia> IsEpimorphism( prj_discrete )
true

julia> Display( Exponential( T, G ) )
( [ 0, 1, 2 ],
  [ 0 = [ 0, 1 ], 1 = [ 0, 1 ], 2 = [ 1, 2 ],
    3 = [ 2, 1 ], 4 = [ 2, 2 ] ] )

julia> t = UniversalMorphismIntoTerminalObject( V )
<A morphism in FinQuivers>

julia> Display( t )
Image of <(V)>:
[ 0 ] ⱶ[ 0 ]→ [ 0 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data

julia> embG = Exponential( t, G )
<A morphism in FinQuivers>

julia> Display( embG )
Image of <(V)>:
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

Image of <(A)>:
[ 0,..., 4 ] ⱶ[ 3, 3, 7, 5, 8 ]→ [ 0,..., 8 ]

A morphism in FinQuivers
given by the above data

julia> IsEpimorphism( embG )
false

julia> emb_complete = Exponential( t, complete )
<A morphism in FinQuivers>

julia> Display( emb_complete )
Image of <(V)>:
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

Image of <(A)>:
[ 0,..., 8 ] ⱶ[ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]→ [ 0,..., 8 ]

A morphism in FinQuivers
given by the above data

julia> IsEpimorphism( emb_complete )
true

julia> s = FinQuivers.s
<A morphism in FinQuivers>

julia> Display( s )
Image of <(V)>:
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data

julia> t = FinQuivers.t
<A morphism in FinQuivers>

julia> Display( t )
Image of <(V)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data

julia> omega = SubobjectClassifier( FinQuivers )
<An object in FinQuivers>

julia> Display( omega )
( [ 0, 1 ],
  [ 0 = [ 0, 0 ], 1 = [ 1, 0 ], 2 = [ 0, 1 ],
    3 = [ 1, 1 ], 4 = [ 1, 1 ] ] )

julia> HomStructure( A, omega )
|5|

julia> subsA = ListOfSubobjects( A );

julia> Length( subsA )
5

julia> Perform( subsA, Display )
Image of <(V)>:
∅ ⱶ[  ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data
Image of <(V)>:
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data
Image of <(V)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data
Image of <(V)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(A)>:
∅ ⱶ[  ]→ [ 0 ]

A morphism in FinQuivers
given by the above data
Image of <(V)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(A)>:
[ 0 ] ⱶ[ 0 ]→ [ 0 ]

A morphism in FinQuivers
given by the above data

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> L = CreateQuiver( 3, [ 1,0,  2,0,  2,2 ] )
<An object in FinQuivers>

julia> R = CreateQuiver( 4, [ 0,1,  2,0,  0,3 ] )
<An object in FinQuivers>

julia> l = Subobject( L, [ 0, 1 ], [ ] )
<A morphism in FinQuivers>

julia> r = Subobject( R, [ 0, 1 ], [ ] )
<A morphism in FinQuivers>

julia> G = CreateQuiver( 4, [ 1,0,  3,0,  3,3,  2,0,  2,1 ] )
<An object in FinQuivers>

julia> m = Subobject( G, [ 3, 1, 2 ] )
<A morphism in FinQuivers>

julia> Source( m ) == L
true

julia> p = DPO( m, l, r );

julia> p[2]
<A morphism in FinQuivers>

julia> Display( p[2] )
Image of <(V)>:
[ 0,..., 3 ] ⱶ[ 0, 2, 3, 4 ]→ [ 0,..., 4 ]

Image of <(A)>:
[ 0, 1, 2 ] ⱶ[ 2, 3, 4 ]→ [ 0,..., 4 ]

A morphism in FinQuivers
given by the above data

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, QuotientCategories, LinearAlgebraForCAP, LinearClosuresForCAP, AdditiveClosuresForCAP, FreydCategoriesForCAP, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, FpCategories, FpLinearCategories, Locales, FiniteCocompletions, PresheafCategories, SubcategoriesForCAP, FunctorCategories

julia> true
true

julia> FinReflexiveQuivers
FinReflexiveQuivers

julia> V = FinReflexiveQuivers.V
<An object in FinReflexiveQuivers>

julia> Display( V )
( [ 0 ], [ 0 = [ 0 ] ] )

julia> A = FinReflexiveQuivers.A
<An object in FinReflexiveQuivers>

julia> Display( A )
( [ 0, 1 ], [ 0 = [ 0, 1 ], 1 = [ 0 ], 2 = [ 1 ] ] )

julia> T = TerminalObject( FinReflexiveQuivers )
<An object in FinReflexiveQuivers>

julia> Display( T )
( [ 0 ], [ 0 = [ 0 ] ] )

julia> T == V
true

julia> G = CreateReflexiveQuiver( 2,
                     [ 1, 4 ],
                     [ 0,1, 0,0, 0,0, 1,0, 1,1 ] )
<An object in FinReflexiveQuivers>

julia> IsWellDefined( G )
true

julia> Display( G )
( [ 0, 1 ],
  [ 0 = [ 0, 1 ], 1 = [ 0 ], 2 = [ 0, 0 ], 3 = [ 1, 0 ], 4 = [ 1 ] ] )

julia> global_G = HomStructure( T, G )
|2|

julia> Display( global_G )
[ 0, 1 ]

julia> DirectProduct( G, V ) == G
true

julia> iso = CartesianLeftEvaluationMorphism( T, G )
<A morphism in FinReflexiveQuivers>

julia> IsIsomorphism( iso )
true

julia> Display( iso )
Image of <(C0)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0,..., 4 ] ⱶ[ 1, 2, 3, 0, 4 ]→ [ 0,..., 4 ]

A morphism in FinReflexiveQuivers
given by the above data

julia> s = FinReflexiveQuivers.s;

julia> IsSplitMonomorphism( s )
true

julia> Display( s )
Image of <(C0)>:
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data

julia> t = FinReflexiveQuivers.t;

julia> IsSplitMonomorphism( t )
true

julia> Display( t )
Image of <(C0)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0 ] ⱶ[ 2 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data

julia> l = FinReflexiveQuivers.l;

julia> IsSplitEpimorphism( l )
true

julia> Display( l )
Image of <(C0)>:
[ 0, 1 ] ⱶ[ 0, 0 ]→ [ 0 ]

Image of <(C1)>:
[ 0, 1, 2 ] ⱶ[ 0, 0, 0 ]→ [ 0 ]

A morphism in FinReflexiveQuivers
given by the above data

julia> omega = SubobjectClassifier( FinReflexiveQuivers )
<An object in FinReflexiveQuivers>

julia> Display( omega )
( [ 0, 1 ],
  [ 0 = [ 0 ], 1 = [ 1, 0 ], 2 = [ 0, 1 ],
    3 = [ 1, 1 ], 4 = [ 1 ] ] )

julia> HomStructure( A, omega )
|5|

julia> subsA = ListOfSubobjects( A );

julia> Length( subsA )
5

julia> Perform( subsA, Display )
Image of <(C0)>:
∅ ⱶ[  ]→ [ 0, 1 ]

Image of <(C1)>:
∅ ⱶ[  ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data
Image of <(C0)>:
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data
Image of <(C0)>:
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0 ] ⱶ[ 2 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data
Image of <(C0)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0, 1 ] ⱶ[ 1, 2 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data
Image of <(C0)>:
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

Image of <(C1)>:
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

A morphism in FinReflexiveQuivers
given by the above data

```
