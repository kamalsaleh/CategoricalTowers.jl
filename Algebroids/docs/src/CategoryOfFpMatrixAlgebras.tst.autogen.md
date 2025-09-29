
```jldoctest
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> F2 = HomalgRingOfIntegersInSingular( 2 )
GF(2)

julia> MatAlg_F2 = CategoryOfFpMatrixAlgebras( F2 )
CategoryOfFpMatrixAlgebras( GF(2) )

julia> T = TerminalObject( MatAlg_F2 )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> iota = UniversalMorphismFromInitialObject( T )
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> I = Source( iota )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> T = TerminalObject( MatAlg_F2 )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> IsWellDefined( T )
true

julia> iota = UniversalMorphismFromInitialObject( T )
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> IsWellDefined( iota )
true

julia> I = Source( iota )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> K = TensorUnit( MatAlg_F2 )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> IsWellDefined( K )
true

julia> K == I
true

julia> Alg_F2 = UnderlyingCategory( MatAlg_F2 )
CategoryOfFpAlgebras( GF(2) )

julia> Mat_F2 = UnderlyingCategoryOfMatrices( MatAlg_F2 )
Rows( GF(2) )

julia> q = FinQuiver( "q(o)[x:o->o,y:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o]" )

julia> P = PathCategory( q )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )

julia> L = F2[P]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) )

julia> one = L.id_o;

julia> x = L.x;

julia> y = L.y;

julia> relations = [ x^2-x,  y^3-y,  x*y-y*(x+one) ]
[ 1*x^2 + 1*x:(o) → (o), 1*y^3 + 1*y:(o) → (o),  1*y⋅x + 1*x⋅y + 1*y:(o) → (o) ]

julia> Q = L / relations
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) ) / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> Dimension( Q )
6

julia> A = Q / Alg_F2
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( A )
true

julia> Dimension( A )
6

julia> mx = HomalgDiagonalMatrix( [ 1, 0, 1, 0 ], F2 ) / Mat_F2
<A morphism in Rows( GF(2) )>

julia> my = DiagMat( [
                      HomalgZeroMatrix( 2, 2, F2 ),
                      CertainRows( HomalgIdentityMatrix( 2, F2 ), [ 2, 1 ] ) ] ) / Mat_F2
<A morphism in Rows( GF(2) )>

julia> matrix_generators = PairGAP( 4 / Mat_F2, [ mx, my ] )
[ <A row module over GF(2) of rank 4>,  [ <A morphism in Rows( GF(2) )>, <A morphism in Rows( GF(2) )> ] ]

julia> M = ObjectConstructor( MatAlg_F2, PairGAP( A, matrix_generators ) )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> IsWellDefined( M )
true

julia> M == PairGAP( ( L / Alg_F2 ) / relations, matrix_generators ) / MatAlg_F2
true

julia> M.x
1*x:(o) → (o)

julia> M.y
1*y:(o) → (o)

julia> Dimension( M )
6

julia> NrGenerators( M )
2

julia> Generators( M )
[ 1*x:(o) → (o), 1*y:(o) → (o) ]

julia> MatrixGenerators( M ) == [ mx, my ]
true

julia> AssociatedLinearClosureOfPathCategory( M )
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) )

julia> DefiningRelations( M )
[ 1*x^2 + 1*x:(o) → (o), 1*y^3 + 1*y:(o) → (o),   1*y⋅x + 1*x⋅y + 1*y:(o) → (o) ]

julia> AssociatedQuotientCategoryOfLinearClosureOfPathCategory( M )
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) ) / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> GroebnerBasisOfDefiningRelations( M )
[ 1*x^2 + 1*x:(o) → (o), 1*y^3 + 1*y:(o) → (o),   1*y⋅x + 1*x⋅y + 1*y:(o) → (o) ]

julia> TestMonoidalUnitorsForInvertibility( MatAlg_F2, M )
true

julia> TestMonoidalTriangleIdentity( MatAlg_F2, M, M )
true

julia> TestAssociatorForInvertibility( MatAlg_F2, M, M, M )
true

julia> TestMonoidalPentagonIdentity( MatAlg_F2, M, M, M, M )
true

julia> TestBraidingForInvertibility( MatAlg_F2, M, M )
true

julia> TestBraidingCompatibility( MatAlg_F2, M, M, M )
true

julia> BraidingInverse( M, M ) == Braiding( M, M )
true

julia> TestCartesianTriangleIdentity( MatAlg_F2, M, I )
true

julia> TestCartesianAssociatorForInvertibility( MatAlg_F2, M, I, T )
true

julia> TestCartesianPentagonIdentity( MatAlg_F2, I, M, I, T )
true

julia> TestCartesianBraidingForInvertibility( MatAlg_F2, M, I )
true

julia> TestCartesianBraidingCompatibility( MatAlg_F2, I, M, T )
true

julia> CartesianBraidingInverse( M, I ) == CartesianBraiding( I, M )
true

```
