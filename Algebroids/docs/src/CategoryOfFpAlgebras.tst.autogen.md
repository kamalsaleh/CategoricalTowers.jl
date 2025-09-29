
```jldoctest
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> F2 = HomalgRingOfIntegersInSingular( 2 )
GF(2)

julia> Alg_F2 = CategoryOfFpAlgebras( F2 )
CategoryOfFpAlgebras( GF(2) )

julia> T = TerminalObject( Alg_F2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> t = UniversalMorphismIntoTerminalObject( T )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> id0 = IdentityMorphism( T )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> id0 == t
true

julia> iota = UniversalMorphismFromInitialObject( T )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> I = Source( iota )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( I )
true

julia> K = TensorUnit( Alg_F2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> q1 = FinQuiver( "q(o)[x:o->o,y:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o]" )

julia> P1 = PathCategory( q1 )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )

julia> L1 = F2[P1]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) )

julia> one = L1.id_o;

julia> x = L1.x;

julia> y = L1.y;

julia> relations1 = [ x^2-x,  y^3-y,  x*y-y*(x+one) ]
[ 1*x^2 + 1*x:(o) → (o), 1*y^3 + 1*y:(o) → (o),  1*y⋅x + 1*x⋅y + 1*y:(o) → (o) ]

julia> Q1 = L1 / relations1
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) ) / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> Dimension( Q1 )
6

julia> AQ1 = AssociatedAlgebroid( Q1 )
Algebra( GF(2), FreeCategory( RightQuiver( "q(o)[x:o->o,y:o->o]" ) ) ) / relations

julia> Dimension( AQ1 )
6

julia> A1 = Q1 / Alg_F2
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> A1 == ( L1 / Alg_F2 ) / relations1
true

julia> IsWellDefined( A1 )
true

julia> Dimension( A1 )
6

julia> id1 = IdentityMorphism( A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( id1 )
true

julia> ProjectionOntoCoequalizer( [ id1, id1 ] ) == id1
true

julia> IsOne( UniversalMorphismFromCoequalizer( [ id1, id1 ], id1 ) )
true

julia> unit1 = UniversalMorphismFromInitialObject( A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> counit1 = Counit( A1, [ 1, 0 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( counit1 )
true

julia> o = A1.id_o
1*id(o):(o) → (o)

julia> x = A1.x
1*x:(o) → (o)

julia> y = A1.y
1*y:(o) → (o)

julia> comult1 = Comultiplication( A1,
                           [ [ [ o, x ], [ x, o ], [ o, o ], [ y^2, y^2 ] ],
                             [ [ o, y ], [ y, o + y^2 ] ] ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> q2 = FinQuiver( "q(o)[x:o->o,y:o->o,z:o->o,t:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" )

julia> P2 = PathCategory( q2 )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) )

julia> L2 = F2[P2]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) ) )

julia> Q2 = L2 / [ L2.x+L2.y+L2.t+L2.tt-L2.id_o, L2.xx-L2.x, L2.yy-L2.y, L2.xy, L2.yx,
                     L2.zz-L2.t-L2.tt, L2.zz-L2.ttt, L2.zt-L2.ttz, L2.zt+L2.ztt-L2.z,
                     L2.xt+L2.yt, L2.tx+L2.ty ]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) ) ) / [ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, 1*y^2 + 1*y, ... ]

julia> A2 = Q2 / Alg_F2
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( A2 )
true

julia> Dimension( A2 )
6

julia> A12 = TensorProduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A12 )
36

julia> IsWellDefined( A12 )
true

julia> beta = Braiding( A1, A2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( beta )
true

julia> beta_i = BraidingInverse( A1, A2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( beta_i )
true

julia> IsOne( PreCompose( beta, beta_i ) )
true

julia> IsOne( PreCompose( beta_i, beta ) )
true

julia> alpha = AssociatorLeftToRight( A1, A2, A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( alpha )
true

julia> alpha_i = AssociatorRightToLeft( A1, A2, A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( alpha_i )
true

julia> IsOne( PreCompose( alpha, alpha_i ) )
true

julia> IsOne( PreCompose( alpha_i, alpha ) )
true

julia> A1xA2 = DirectProduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A1xA2 )
12

julia> diagram = [ A1, A2 ]
[ <An object in CategoryOfFpAlgebras( GF(2) )>,
  <An object in CategoryOfFpAlgebras( GF(2) )> ]

julia> pr1 = ProjectionInFactorOfDirectProduct( diagram, 1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( pr1 )
true

julia> pr2 = ProjectionInFactorOfDirectProduct( diagram, 2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( pr2 )
true

julia> u = UniversalMorphismIntoDirectProduct( [ pr1, pr2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( u )
true

julia> IsOne( u )
true

julia> v = TensorProduct( pr1, pr2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( v )
true

julia> A1uA2 = Coproduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> i1 = InjectionOfCofactorOfCoproduct( diagram, 1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( i1 )
true

julia> i2 = InjectionOfCofactorOfCoproduct( diagram, 2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( i2 )
true

julia> w = UniversalMorphismFromCoproduct( [ i1, i2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( w )
true

julia> IsOne( w )
true

julia> cart_fact = LeftCartesianDistributivityFactoring( A1, [ A1, A2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( cart_fact )
true

julia> cocart_expand = LeftCocartesianCodistributivityExpanding( A1, [ A1, A2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( cocart_expand )
true

julia> TestMonoidalUnitorsForInvertibility( Alg_F2, A1 )
true

julia> TestMonoidalTriangleIdentity( Alg_F2, A1, A2 )
true

julia> TestAssociatorForInvertibility( Alg_F2, A1, A2, A1 )
true

julia> TestMonoidalPentagonIdentity( Alg_F2, A1, A2, I, A1 )
true

julia> TestBraidingForInvertibility( Alg_F2, A1, A2 )
true

julia> TestBraidingCompatibility( Alg_F2, I, A2, T )
true

julia> BraidingInverse( A1, A2 ) == Braiding( A2, A1 )
true

julia> TestCartesianTriangleIdentity( Alg_F2, A1, I )
true

julia> TestCartesianAssociatorForInvertibility( Alg_F2, A1, I, T )
true

julia> TestCartesianPentagonIdentity( Alg_F2, I, A1, I, T )
true

julia> TestCartesianBraidingForInvertibility( Alg_F2, A2, I )
true

julia> TestCartesianBraidingCompatibility( Alg_F2, I, A1, T )
true

julia> CartesianBraidingInverse( A1, A2 ) == CartesianBraiding( A2, A1 )
true

julia> TestCocartesianAssociatorForInvertibility( Alg_F2, A1, A2, A1 )
true

julia> TestCocartesianPentagonIdentity( Alg_F2, A1, A2, I, A1 )
true

julia> TestCocartesianBraidingForInvertibility( Alg_F2, A1, A2 )
true

julia> TestCocartesianBraidingCompatibility( Alg_F2, A1, A2, I )
true

julia> CocartesianBraidingInverse( A1, A2 ) == CocartesianBraiding( A2, A1 )
true


```
