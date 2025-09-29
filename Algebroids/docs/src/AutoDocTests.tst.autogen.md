
```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(o)[m:o->o]" )
q(o)[m:o->o]

julia> o = q.o
(o)

julia> m = q.m
(m)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> N = FreeCategory( q )
FreeCategory( RightQuiver( "q(o)[m:o->o]" ) )

julia> IsCommutative( N )
true

julia> N.o
<(o)>

julia> N.m
(o)-[(m)]->(o)

julia> SetOfObjects( N )
[ <(o)> ]

julia> SetOfGeneratingMorphisms( N )
[ (o)-[(m)]->(o) ]

julia> SetOfGeneratingMorphisms( N, N.o, N.o )
[ (o)-[(m)]->(o) ]

julia> ObjectInFpCategory( N, o ) == N.o
true

julia> N.o == o / N
true

julia> IdentityMorphism( N.o )
(o)-[(o)]->(o)

julia> MorphismInFpCategory( N, m ) == N.m
true

julia> N.m == m / N
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> PreCompose( N.m, N.m )
(o)-[(m*m)]->(o)

julia> unit = Unit( N )
Functor from FreeCategory( RightQuiver( "*(1)[]" ) ) ->
FreeCategory( RightQuiver( "q(o)[m:o->o]" ) )

julia> mul = Multiplication( N )
Functor from
FreeCategory( RightQuiver( "qxq(oo)[om:oo->oo,mo:oo->oo]" ) ) / relations ->
FreeCategory( RightQuiver( "q(o)[m:o->o]" ) )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(o)[m:o->o,i:o->o]" )
q(o)[m:o->o,i:o->o]

julia> o = q.o
(o)

julia> m = q.m
(m)

julia> i = q.i
(i)

julia> L = [ [ m * i, o ], [ i * m, o ] ]
[ [ (m*i), (o) ], [ (i*m), (o) ] ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> zz = Category( q, L )
FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i == o, i*m == o ]

julia> IsCommutative( zz )
true

julia> zz.o
<(o)>

julia> IsWellDefined( zz.o )
true

julia> m = zz.m
(o)-[(m)]->(o)

julia> i = zz.i
(o)-[(i)]->(o)

julia> SetOfObjects( zz )
[ <(o)> ]

julia> SetOfGeneratingMorphisms( zz )
[ (o)-[(m)]->(o), (o)-[(i)]->(o) ]

julia> SetOfGeneratingMorphisms( zz, zz.o, zz.o )
[ (o)-[(m)]->(o), (o)-[(i)]->(o) ]

julia> ObjectInFpCategory( zz, o ) == zz.o
true

julia> zz.o == o / zz
true

julia> IdentityMorphism( zz.o )
(o)-[(o)]->(o)

julia> MorphismInFpCategory( zz, q.m ) == zz.m
true

julia> zz.m == q.m / zz
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> m2 = PreCompose( [ m, i, m, m, i, m, i, m ] )
(o)-[(m*m)]->(o)

julia> IsWellDefined( m2 )
true

julia> unit = Unit( zz )
Functor from FreeCategory( RightQuiver( "*(1)[]" ) ) ->
FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i == o, i*m == o ]

julia> mul = Multiplication( zz )
Functor from
FreeCategory( RightQuiver(
  "qxq(oo)[om:oo->oo,oi:oo->oo,mo:oo->oo,io:oo->oo]" ) ) / relations ->
FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i == o, i*m == o ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> ql = LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" )
ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> qr = RightQuiver( "qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" )
qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> Cl = FreeCategory( ql )
FreeCategory( LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" ) )

julia> Cr = FreeCategory( qr )
FreeCategory( RightQuiver( "qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" ) )

julia> Cl.u
<(u)>

julia> Cr.u
<(u)>

julia> Cl.a
(v)<-[(a)]-(u)

julia> Cr.a
(u)-[(a)]->(v)

julia> SetOfObjects( Cl )
[ <(u)>, <(v)>, <(w)> ]

julia> SetOfGeneratingMorphisms( Cl )
[ (v)<-[(a)]-(u), (u)<-[(b)]-(v), (u)<-[(c)]-(v), (w)<-[(d)]-(v) ]

julia> SetOfGeneratingMorphisms( Cl, Cl.u, Cl.v )
[ (v)<-[(a)]-(u) ]

julia> SetOfObjects( Cr )
[ <(u)>, <(v)>, <(w)> ]

julia> SetOfGeneratingMorphisms( Cr )
[ (u)-[(a)]->(v), (v)-[(b)]->(u), (v)-[(c)]->(u), (v)-[(d)]->(w) ]

julia> SetOfGeneratingMorphisms( Cr, Cr.u, Cr.v )
[ (u)-[(a)]->(v) ]

julia> ObjectInFpCategory( Cl, ql.u ) == Cl.u
true

julia> Cl.u == ql.u / Cl
true

julia> MorphismInFpCategory( Cl, ql.a ) == Cl.a
true

julia> Cl.a == ql.a / Cl
true

julia> IdentityMorphism( Cl.u )
(u)<-[(u)]-(u)

julia> IdentityMorphism( Cr.u )
(u)-[(u)]->(u)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> PreCompose( Cl.a, Cl.d )
(w)<-[(d*a)]-(u)

julia> PreCompose( Cr.a, Cr.d )
(u)-[(a*d)]->(w)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q:= RightQuiver( "q(1)[a:1->1]" )
q(1)[a:1->1]

julia> Fq = FreeCategory( q )
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )

julia> C = Fq / [ [ Fq.a^3, Fq.a^2 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == a*a ]

julia> UnderlyingQuiverAlgebra( C )
(Q * q) / [ 1*(a*a*a) - 1*(a*a) ]

julia> Size( C )
3

julia> D = C / [ [ C.a^9, C.1 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) /
[ a*a*a == a*a, a*a == 1 ]

julia> UnderlyingQuiverAlgebra( D )
(Q * q) / [ 1*(a) - 1*(1) ]

julia> Size( D )
1

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> ql = LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" )
ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> qr = RightQuiver( "qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" )
qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> Q = HomalgFieldOfRationals( )
Q

julia> Al = Algebroid( Q, ql )
Algebroid( Q, FreeCategory(
LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" ) ) )

julia> algebra_Al = UnderlyingQuiverAlgebra( Al )
Q * ql

julia> Ar = Algebroid( Q, qr )
Algebroid( Q, FreeCategory(
RightQuiver( "qr(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" ) ) )

julia> algebra_Ar = UnderlyingQuiverAlgebra( Ar )
Q * qr

julia> Al.u
<(u)>

julia> Ar.u
<(u)>

julia> Al.a
(v)<-[1*(a)]-(u)

julia> Ar.a
(u)-[1*(a)]->(v)

julia> SetOfObjects( Al )
[ <(u)>, <(v)>, <(w)> ]

julia> SetOfGeneratingMorphisms( Al )
[ (v)<-[1*(a)]-(u), (u)<-[1*(b)]-(v), (u)<-[1*(c)]-(v), (w)<-[1*(d)]-(v) ]

julia> SetOfGeneratingMorphisms( Al, Al.u, Al.v )
[ (v)<-[1*(a)]-(u) ]

julia> SetOfObjects( Ar )
[ <(u)>, <(v)>, <(w)> ]

julia> SetOfGeneratingMorphisms( Ar )
[ (u)-[1*(a)]->(v), (v)-[1*(b)]->(u), (v)-[1*(c)]->(u), (v)-[1*(d)]->(w) ]

julia> SetOfGeneratingMorphisms( Ar, Ar.u, Ar.v )
[ (u)-[1*(a)]->(v) ]

julia> CommutativeRingOfLinearCategory( Al ) == Q
true

julia> ObjectInAlgebroid( Al, ql.u ) == Al.u
true

julia> Al.u == ql.u / Al
true

julia> MorphismInAlgebroid( Al, algebra_Al.a ) == Al.a
true

julia> Al.a == algebra_Al.a / Al
true

julia> IdentityMorphism( Al.u ) == algebra_Al.u / Al
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> PreCompose( Al.a, Al.d )
(w)<-[1*(d*a)]-(u)

julia> PreCompose( Ar.a, Ar.d )
(u)-[1*(a*d)]->(w)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> Al.b+Al.c
(u)<-[1*(c) + 1*(b)]-(v)

julia> Ar.b+Ar.c
(v)-[1*(c) + 1*(b)]->(u)

julia> Al.b-Al.c
(u)<-[-1*(c) + 1*(b)]-(v)

julia> Ar.b-Ar.c
(v)-[-1*(c) + 1*(b)]->(u)

julia> Al.d - Al.d
(w)<-[0]-(v)

julia> Ar.d - Ar.d
(v)-[0]->(w)

julia> 1/2 * Al.d
(w)<-[1/2*(d)]-(v)

julia> 1/2 * Ar.d
(v)-[1/2*(d)]->(w)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q:= RightQuiver( "q(1)[a:1->1]" )
q(1)[a:1->1]

julia> Fq = FreeCategory( q )
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )

julia> Q = HomalgFieldOfRationals( )
Q

julia> A = Q[Fq]
Algebra( Q, FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) )

julia> UnderlyingQuiverAlgebra( A )
Q * q

julia> B = A / [ 2*A.a^3 - A.a^2  ]
Algebra( Q, FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) ) / relations

julia> UnderlyingQuiverAlgebra( B )
(Q * q) / [ 2*(a*a*a) - 1*(a*a) ]

julia> Dimension( B )
3

julia> C = B / [ B.a^2 + 2*B.a ]
Algebra( Q, FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) ) / relations

julia> UnderlyingQuiverAlgebra( C )
(Q * q) / [ 2*(a*a*a) - 1*(a*a), 1*(a*a) + 2*(a) ]

julia> Dimension( C )
1

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(u,v)[a:u->v,b:v->u]" )
q(u,v)[a:u->v,b:v->u]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(u,v)[a:u->v,b:v->u]" )
q(u,v)[a:u->v,b:v->u]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> B = Algebroid( Qq, [ Qq.a * Qq.b - Qq.u, Qq.b * Qq.a - Qq.v ] )
Algebroid( Q, FreeCategory( RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) )
/ relations

julia> RelationsOfAlgebroid( B )
[ (u)-[1*(a*b) - 1*(u)]->(u), (v)-[1*(b*a) - 1*(v)]->(v) ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> IsCommutative(B)
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> counit = @rec( a = 1, b = 1 )
@rec( a = 1, b = 1 )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> B2 = B^2
Algebroid( Q, FreeCategory( RightQuiver( "qxq(uu,uv,vu,vv)[ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]" ) ) ) / relations

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> comult:= @rec( a = PreCompose(B2.au, B2.va), b:= PreCompose(B2.bv, B2.ub) )
@rec( a = (uu)-[[ 1*(ua*av) ]]->(vv), b = (vv)-[[ 1*(vb*bu) ]]->(uu) )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> AddBialgebroidStructure( B, counit, comult )
Bialgebroid( Q, FreeCategory( RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) )
/ relations

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> counit = Counit( B )
Functor from Bialgebroid( Q, FreeCategory(
RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) ) / relations
->
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> comult = Comultiplication( B )
Functor from Bialgebroid( Q, FreeCategory(
RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) ) / relations
->
Algebroid( Q, FreeCategory(
RightQuiver( "qxq(uu,uv,vu,vv)[ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]" ) ) ) / relations

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> ApplyFunctor( counit, B.u )
<(1)>

julia> ApplyFunctor( counit, B.v )
<(1)>

julia> ApplyFunctor( counit, IdentityMorphism( B.u ) )
(1)-[1*(1)]->(1)

julia> ApplyFunctor( counit, IdentityMorphism( B.v ) )
(1)-[1*(1)]->(1)

julia> ApplyFunctor( counit, B.a )
(1)-[1*(1)]->(1)

julia> ApplyFunctor( counit, B.b )
(1)-[1*(1)]->(1)

julia> ApplyFunctor( comult, B.u )
<(uu)>

julia> ApplyFunctor( comult, B.v )
<(vv)>

julia> ApplyFunctor( comult, IdentityMorphism( B.u ) )
(uu)-[[ 1*(uu) ]]->(uu)

julia> ApplyFunctor( comult, IdentityMorphism( B.v ) )
(vv)-[[ 1*(vv) ]]->(vv)

julia> ApplyFunctor( comult, B.a )
(uu)-[[ 1*(ua*av) ]]->(vv)

julia> ApplyFunctor( comult, B.b )
(vv)-[[ 1*(vb*bu) ]]->(uu)

julia> IsCoassociative(B)
true

julia> IsCocommutative(B)
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[g:1->1,h:1->1]" )
q(1)[g:1->1,h:1->1]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

julia> B = Algebroid( Qq, [ Qq.h * Qq.g - Qq.1, Qq.g * Qq.h - Qq.1 ] )
Algebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations

julia> B2 = B^2
Algebra( Q, FreeCategory( RightQuiver(
"qxq(1x1)[1xg:1x1->1x1,1xh:1x1->1x1,gx1:1x1->1x1,hx1:1x1->1x1]" ) ) )
/ relations

julia> counit_rec = @rec( g = 1, h = 1 );

julia> comult_rec = @rec( g = PreCompose( B2.1xg, B2.gx1 ),
                           h = PreCompose( B2.1xh, B2.hx1 ) );

julia> AddBialgebroidStructure( B, counit_rec, comult_rec )
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations

julia> counit = Counit( B )
Functor from
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations
->
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> comult = Comultiplication( B )
Functor from
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations
->
Algebra( Q, FreeCategory( RightQuiver(
"qxq(1x1)[1xg:1x1->1x1,1xh:1x1->1x1,gx1:1x1->1x1,hx1:1x1->1x1]" ) ) )
/ relations

julia> antipode_rec = @rec( g = B.h, h = B.g );

julia> AddAntipode(B, antipode_rec )

julia> B
HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations

julia> Antipode(B)
Contravariant functor from
HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations
->
HopfAlgebra( Q, Fr eeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
/ relations

julia> ApplyFunctor( counit, B.g )
(1)-[1*(1)]->(1)

julia> IsCommutative(B)
true

julia> IsCounitary(B)
true

julia> IsCocommutative(B)
true

julia> IsHopfAlgebroid(B)
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> # Hopf algebra generated by a primitive element
        q = RightQuiver( "q(1)[t:1->1]" )
q(1)[t:1->1]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

julia> B = Algebroid( Qq )
Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> Q == UnderlyingAlgebra( B )
true

julia> B2 = B^2
Algebra( Q, FreeCategory(
RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

julia> B0 = B^0
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> counit_rec = @rec( t = 0 );

julia> comult_rec = @rec( t = B2.1xt + B2.tx1 );

julia> AddBialgebroidStructure( B, counit_rec, comult_rec )
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> antipode_rec = @rec( t:= -B.t );

julia> AddAntipode( B, antipode_rec )

julia> counit = Counit( B )
Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
->
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> comult = Comultiplication( B )
Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
->
Algebra( Q, FreeCategory(
RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

julia> idB = IdentityFunctor( B )
Identity functor of Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> ApplyFunctor( comult, B.t )
(1x1)-[[ 1*(tx1) + 1*(1xt) ]]->(1x1)

julia> ApplyFunctor( counit, B.t )
(1)-[0]->(1)

julia> IsCommutative(B)
true

julia> IsCounitary(B)
true

julia> IsCocommutative(B)
true

julia> IsHopfAlgebroid(B)
true

julia> BB = CategoryOfAlgebroidsObject(B);

julia> IsCoassociative( BB )
true

julia> IsCounitary( BB )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[t:1->1]" )
q(1)[t:1->1]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

julia> B = Algebroid( Qq )
Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> B2 = B^2
Algebra( Q, FreeCategory(
RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

julia> B0 = B^0
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> counit_rec = @rec( t = 0 );

julia> comult_rec = @rec( t = B2.1xt );

julia> AddBialgebroidStructure( B, counit_rec, comult_rec )
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> antipode_rec = @rec( t:= -B.t );

julia> AddAntipode(B, antipode_rec )

julia> counit = Counit( B )
Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
->
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> comult = Comultiplication( B )
Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
->
Algebra( Q, FreeCategory(
RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

julia> IsCommutative(B)
true

julia> IsCoassociative(B)
true

julia> IsCounitary(B)
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[x:1->1,g:1->1]" )
q(1)[x:1->1,g:1->1]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

julia> H = Algebroid( Qq, [ Qq.g * Qq.g - Qq.1,
                            Qq.x * Qq.x,
                            Qq.x * Qq.g + Qq.g * Qq.x,
                            ] )
Algebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations

julia> H2 = H^2
Algebra( Q, FreeCategory( RightQuiver(
"qxq(1x1)[1xx:1x1->1x1,1xg:1x1->1x1,xx1:1x1->1x1,gx1:1x1->1x1]" ) ) )
/ relations

julia> counit_rec = @rec( x = 0,
                           g = 1
                         );

julia> comult_rec = @rec( g = PreCompose(H2.gx1, H2.1xg),
                           x = H2.1xx + PreCompose(H2.xx1, H2.1xg)
                         );

julia> AddBialgebroidStructure( H, counit_rec, comult_rec )
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations

julia> counit = Counit( H )
Functor from
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations
->
Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

julia> comult = Comultiplication( H )
Functor from
Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations
->
Algebra( Q, FreeCategory( RightQuiver(
"qxq(1x1)[1xx:1x1->1x1,1xg:1x1->1x1,xx1:1x1->1x1,gx1:1x1->1x1]" ) ) )
/ relations

julia> antipode_rec = @rec( g:= H.g,
                             x = - PreCompose( H.x, H.g )
                           );

julia> AddAntipode(H, antipode_rec )

julia> antipode = Antipode( H )
Contravariant functor from
HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations
->
HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
/ relations

julia> IsCommutative(H)
false

julia> ApplyFunctor(antipode, H.g)
(1)-[[ 1*(g) ]]->(1)

julia> ApplyFunctor(antipode, H.x)
(1)-[[ -1*(x*g) ]]->(1)

julia> IsEqualForMorphisms(
                ApplyFunctor( antipode, H.x ),
                -PreCompose( H.x, H.g ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> IsEqualForMorphisms( ApplyFunctor( antipode, H.g ), H.g )
true

julia> IsEqualForMorphisms( ApplyFunctor( antipode, H.x ), H.x )
false

julia> IsEqualForMorphisms( ApplyFunctor(
            PreCompose( [ antipode, antipode ] ), H.x ), H.x )
false

julia> IsEqualForMorphisms( ApplyFunctor(
            PreCompose( [ antipode, antipode, antipode ] ), H.x ), H.x )
false

julia> IsEqualForMorphisms( ApplyFunctor(
            PreCompose( [ antipode, antipode, antipode, antipode ] ), H.x ), H.x )
true

julia> IsCocommutative(H)
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(4)[> x0:1->2,x1:1->2,x2:1->2,x3:1->2,> y0:2->3,y1:2->3,y2:2->3,y3:2->3,> z0:3->4,z1:3->4,z2:3->4,z3:3->4]" );

julia> F = FreeCategory( q );

julia> beilinson_P3 = F /
                        [ [ PreCompose( F.x0, F.y1 ), PreCompose( F.x1, F.y0 ) ],
                          [ PreCompose( F.x0, F.y2 ), PreCompose( F.x2, F.y0 ) ],
                          [ PreCompose( F.x0, F.y3 ), PreCompose( F.x3, F.y0 ) ],
                          [ PreCompose( F.x1, F.y2 ), PreCompose( F.x2, F.y1 ) ],
                          [ PreCompose( F.x1, F.y3 ), PreCompose( F.x3, F.y1 ) ],
                          [ PreCompose( F.x2, F.y3 ), PreCompose( F.x3, F.y2 ) ],
                          [ PreCompose( F.y0, F.z1 ), PreCompose( F.y1, F.z0 ) ],
                          [ PreCompose( F.y0, F.z2 ), PreCompose( F.y2, F.z0 ) ],
                          [ PreCompose( F.y0, F.z3 ), PreCompose( F.y3, F.z0 ) ],
                          [ PreCompose( F.y1, F.z2 ), PreCompose( F.y2, F.z1 ) ],
                          [ PreCompose( F.y1, F.z3 ), PreCompose( F.y3, F.z1 ) ],
                          [ PreCompose( F.y2, F.z3 ), PreCompose( F.y3, F.z2 ) ] ];

julia> Q = HomalgFieldOfRationals( );

julia> Beilinson_P3 = Q[beilinson_P3];

julia> objs = SetOfObjects( Beilinson_P3 );

julia> Length( objs ) == 4
true

julia> maps = SetOfGeneratingMorphisms( Beilinson_P3.1, Beilinson_P3.2 );

julia> maps == SetOfGeneratingMorphisms( Beilinson_P3, 1, 2 )
true

julia> Length( maps ) == 4
true

julia> ForAll( (0):(3), k ->
                RankOfObject( HomomorphismStructureOnObjects( objs[1], objs[1 + k] ) )
                == Binomial( 4 + k - 1, k )
        )
true

julia> alpha = Beilinson_P3.x0;

julia> beta = ( Beilinson_P3.z1 + Beilinson_P3.z2 );

julia> gamma = PreCompose( [ alpha, (Beilinson_P3.y1 - Beilinson_P3.y3), beta ] );

julia> sol = SolveLinearSystemInAbCategory(
                       [ [ alpha ] ], [ [ beta ] ], [ gamma ] )[1];

julia> IsCongruentForMorphisms( PreCompose( [ alpha, sol, beta ] ), gamma )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(4)[a:1->2,b:1->3,c:3->4,d:2->4]" );

julia> Q = HomalgFieldOfRationals( );

julia> Qq = PathAlgebra( Q, q );

julia> Qq = Qq / [ Qq.a * Qq.d - Qq.b * Qq.c];

julia> A_Q = Algebroid( Qq );

julia> A_Z = DescentToZDefinedByBasisPaths( A_Q );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> alpha = 2 * A_Q.a;

julia> id = IdentityMorphism( A_Q.4 );

julia> gamma = PreCompose( A_Q.b, A_Q.c );

julia> sol = SolveLinearSystemInAbCategory( [ [ alpha ] ], [ [ id ] ], [ gamma ] )
[ (2)-[[ 1/2*(d) ]]->(4) ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> alpha = 2 * A_Z.a;

julia> id = IdentityMorphism( A_Z.4 );

julia> gamma = PreCompose( A_Z.b, A_Z.c );

julia> sol = MereExistenceOfSolutionOfLinearSystemInAbCategory(
                       [ [ alpha ] ], [ [ id ] ], [ gamma ] )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" );

julia> Q = HomalgFieldOfRationals( );

julia> B = Algebroid( Q, q );

julia> B0 = B^0;

julia> lu = LeftUnitorAsFunctor(B);

julia> ru = RightUnitorAsFunctor(B);

julia> lui = LeftUnitorInverseAsFunctor(B);

julia> rui = RightUnitorInverseAsFunctor(B);

julia> AsCapCategory(Target(lu)) == B
true

julia> AsCapCategory(Target(ru)) == B
true

julia> AsCapCategory(Source(lu)) == TensorProductOnObjects( B0, B )
true

julia> AsCapCategory(Source(ru)) == TensorProductOnObjects( B, B0 )
true

julia> AsCapCategory(Source(lui)) == B
true

julia> AsCapCategory(Source(rui)) == B
true

julia> AsCapCategory(Target(lui)) == TensorProductOnObjects( B0, B )
true

julia> AsCapCategory(Target(rui)) == TensorProductOnObjects( B, B0 )
true

julia> l = @Concatenation( [
                     List( SetOfObjects(B),
                           o -> ApplyFunctor( PreCompose(lui, lu), o) == o &&
                           ApplyFunctor( PreCompose(rui, ru), o) == o ),
                     List( SetOfGeneratingMorphisms(B),
                           m -> ApplyFunctor( PreCompose(lui, lu), m) == m &&
                           ApplyFunctor( PreCompose(rui, ru), m) == m ),
                     List( SetOfObjects(B^0 * B),
                           o -> ApplyFunctor( PreCompose(lu, lui), o) == o ),
                     List( SetOfGeneratingMorphisms(B^0 * B),
                           m -> ApplyFunctor( PreCompose(lu, lui), m) == m)
         ] );

julia> and_function = function(x,y) return x && y; end;

julia> Iterated( l, and_function )
true

julia> # Consider B as an object in the category of algebroids over Q
        BB = CategoryOfAlgebroidsObject(B);

julia> BB2 = TensorProductOnObjects(BB, BB);

julia> BB0 = TensorUnit( CapCategory( BB ) );

julia> ru_as_functor = RightUnitor( BB );

julia> lu_as_functor = LeftUnitor( BB );

julia> rui_as_functor = RightUnitorInverse( BB );

julia> lui_as_functor = LeftUnitorInverse( BB );

julia> IsCongruentForMorphisms( PreCompose( ru_as_functor, rui_as_functor ),
                IdentityMorphism( TensorProductOnObjects( BB,  BB0 ) ) )
true

julia> IsCongruentForMorphisms( PreCompose( lu_as_functor, lui_as_functor ),
                IdentityMorphism( TensorProductOnObjects( BB0,  BB ) ) )
true

julia> IsCongruentForMorphisms( PreCompose( rui_as_functor, ru_as_functor ),
                IdentityMorphism( BB ) )
true

julia> IsCongruentForMorphisms( PreCompose( lui_as_functor, lu_as_functor ),
                IdentityMorphism( BB ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[t:1->1]" )
q(1)[t:1->1]

julia> Q = HomalgFieldOfRationals( )
Q

julia> Qq = PathAlgebra( Q, q )
Q * q

julia> B = Algebroid( Qq )
Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

julia> ass_ltr = AssociatorLeftToRightWithGivenTensorProductsAsFunctor(
                           (B*B)*B, B, B, B, B*(B*B) );

julia> ass_rtl = AssociatorRightToLeftWithGivenTensorProductsAsFunctor(
                           B*(B*B), B, B, B, (B*B)*B );

julia> Source(ass_ltr) == Target(ass_rtl)
true

julia> Target(ass_ltr) == Source(ass_rtl)
true

julia> # Consider B as an object in the category of algebroids over Q
        BB = CategoryOfAlgebroidsObject(B);

julia> BB2 = TensorProductOnObjects(BB, BB);

julia> BB0 = TensorUnit( CapCategory( BB ) );

julia> ass_ltr_as_morphism = AssociatorLeftToRight(BB,BB,BB);

julia> ass_rtl_as_morphism = AssociatorRightToLeft(BB,BB,BB);

julia> IsCongruentForMorphisms(
                PreCompose( ass_ltr_as_morphism, ass_rtl_as_morphism ),
                IdentityMorphism( Source( ass_ltr_as_morphism ) ) )
true

julia> IsCongruentForMorphisms(
                PreCompose( ass_rtl_as_morphism, ass_ltr_as_morphism ),
                IdentityMorphism( Source( ass_rtl_as_morphism ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[a:1->1]" )
q(1)[a:1->1]

julia> Fq = FreeCategory( q )
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )

julia> M0 = Fq / [ [ Fq.a^3, Fq.1 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == 1 ]

julia> S0 = SieveFunctor( M0 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == 1 ]
-> SkeletalFinSets

julia> M0op = AsCapCategory( Source( S0 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == 1 ]

julia> S0( M0op.1 )
|2|

julia> Display( S0( M0op.1 ) )
[ 0, 1 ]

julia> S0( M0op.a )
|2| → |2|

julia> Display( S0( M0op.a ) )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

julia> M1 = Fq / [ [ Fq.a^3, Fq.a ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == a ]

julia> S1 = SieveFunctor( M1 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a ]
-> SkeletalFinSets

julia> M1op = AsCapCategory( Source( S1 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a ]

julia> S1( M1op.1 )
|3|

julia> Display( S1( M1op.1 ) )
[ 0, 1, 2 ]

julia> S1( M1op.a )
|3| → |3|

julia> Display( S1( M1op.a ) )
[ 0, 1, 2 ] ⱶ[ 0, 2, 2 ]→ [ 0, 1, 2 ]

julia> M2 = Fq / [ [ Fq.a^3, Fq.a^2 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == a*a ]

julia> S2 = SieveFunctor( M2 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> M2op = AsCapCategory( Source( S2 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]

julia> S2( M2op.1 )
|4|

julia> Display( S2( M2op.1 ) )
[ 0 ,..., 3 ]

julia> S2( M2op.a )
|4| → |4|

julia> Display( S2( M2op.a ) )
[ 0,..., 3 ] ⱶ[ 0, 2, 3, 3 ]→ [ 0,..., 3 ]

julia> eta2 = TruthMorphismOfTrueToSieveFunctor( M2 )
Natural transformation from
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets
->
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> eta2( M2op.1 )
|1| → |4|

julia> Display( eta2( M2op.1 ) )
[ 0 ] ⱶ[ 3 ]→ [ 0,..., 3 ]

julia> iota2 = EmbeddingOfSieveFunctor( M2 )
Natural transformation from
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets
->
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> iota2( M2op.1 )
|4| → |8|

julia> Display( iota2( M2op.1 ) )
[ 0,..., 3 ] ⱶ[ 0, 4, 6, 7 ]→ [ 0,..., 7 ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> q = RightQuiver( "q(1)[a:1->1]" )
q(1)[a:1->1]

julia> Fq = FreeCategory( q )
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )

julia> M0 = Fq / [ [ Fq.a^3, Fq.1 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == 1 ]

julia> S0 = SieveFunctor( M0 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == 1 ]
-> SkeletalFinSets

julia> M0op = AsCapCategory( Source( S0 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == 1 ]

julia> S0( M0op.1 )
|2|

julia> Display( S0( M0op.1 ) )
[ 0, 1 ]

julia> S0( M0op.a )
|2| → |2|

julia> Display( S0( M0op.a ) )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

julia> M1 = Fq / [ [ Fq.a^3, Fq.a ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == a ]

julia> S1 = SieveFunctor( M1 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a ]
-> SkeletalFinSets

julia> M1op = AsCapCategory( Source( S1 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a ]

julia> S1( M1op.1 )
|3|

julia> Display( S1( M1op.1 ) )
[ 0, 1, 2 ]

julia> S1( M1op.a )
|3| → |3|

julia> Display( S1( M1op.a ) )
[ 0, 1, 2 ] ⱶ[ 0, 2, 2 ]→ [ 0, 1, 2 ]

julia> M2 = Fq / [ [ Fq.a^3, Fq.a^2 ] ]
FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a == a*a ]

julia> S2 = SieveFunctor( M2 )
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> M2op = AsCapCategory( Source( S2 ) )
FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]

julia> S2( M2op.1 )
|4|

julia> Display( S2( M2op.1 ) )
[ 0 ,..., 3 ]

julia> S2( M2op.a )
|4| → |4|

julia> Display( S2( M2op.a ) )
[ 0,..., 3 ] ⱶ[ 0, 2, 3, 3 ]→ [ 0,..., 3 ]

julia> eta2 = TruthMorphismOfTrueToSieveFunctor( M2 )
Natural transformation from
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets
->
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> eta2( M2op.1 )
|1| → |4|

julia> Display( eta2( M2op.1 ) )
[ 0 ] ⱶ[ 3 ]→ [ 0,..., 3 ]

julia> iota2 = EmbeddingOfSieveFunctor( M2 )
Natural transformation from
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets
->
Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a == a*a ]
-> SkeletalFinSets

julia> iota2( M2op.1 )
|4| → |8|

julia> Display( iota2( M2op.1 ) )
[ 0,..., 3 ] ⱶ[ 0, 4, 6, 7 ]→ [ 0,..., 7 ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> Delta1 = SimplicialCategoryTruncatedInDegree( 1 )
PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0) ]

julia> Size( Delta1 )
7

julia> mors = SetOfMorphisms( Delta1 )
[ [id(C0)]:(C0) → (C0), [id]:(C1) → (C0), [s]:(C0) → (C1), [t]:(C0) → (C1),
  [id(C1)]:(C1) → (C1), [id⋅s]:(C1) → (C1), [id⋅t]:(C1) → (C1) ]

julia> List( mors, DecompositionOfMorphismInCategory )
[ [  ], [ [id]:(C1) → (C0) ], [ [s]:(C0) → (C1) ], [ [t]:(C0) → (C1) ],
  [  ], [ [id]:(C1) → (C0), [s]:(C0) → (C1) ],
  [ [id]:(C1) → (C0), [t]:(C0) → (C1) ] ]

julia> C = CategoryFromDataTables( Delta1 )
PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0) ]

julia> Size( C )
7

julia> morsC = SetOfMorphisms( C )
[ (C0)-[(C0)]->(C0), (C1)-[(id)]->(C0), (C0)-[(s)]->(C1), (C0)-[(t)]->(C1),
  (C1)-[(C1)]->(C1), (C1)-[(id*s)]->(C1), (C1)-[(id*t)]->(C1) ]

julia> List( morsC, DecompositionOfMorphismInCategory )
[ [  ], [ (C1)-[(id)]->(C0) ], [ (C0)-[(s)]->(C1) ], [ (C0)-[(t)]->(C1) ],
  [  ], [ (C1)-[(id)]->(C0), (C0)-[(s)]->(C1) ],
  [ (C1)-[(id)]->(C0), (C0)-[(t)]->(C1) ] ]

julia> NerveTruncatedInDegree2Data( C ) == NerveTruncatedInDegree2Data( Delta1 )
true

julia> IndicesOfGeneratingMorphisms( C )
[ 1, 2, 3 ]

julia> SetOfGeneratingMorphisms( C )
[ (C1)-[(id)]->(C0), (C0)-[(s)]->(C1), (C0)-[(t)]->(C1) ]

julia> Display( C )
A CAP category with name
PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0) ]:

19 primitive operations were used to derive 55 operations for this category
which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsFiniteCategory
* IsEquippedWithHomomorphismStructure

julia> C0 = CreateObject( C, 0 )
<(C0)>

julia> IsWellDefined( C0 )
true

julia> C1 = 1 / C
<(C1)>

julia> IsWellDefined( C1 )
true

julia> IsWellDefined( 2 / C )
false

julia> idC0 = CreateMorphism( C0, 0, C0 )
(C0)-[(C0)]->(C0)

julia> CreateMorphism( C, 0 ) == idC0
true

julia> IsOne( idC0 )
true

julia> id = CreateMorphism( C, 1 )
(C1)-[(id)]->(C0)

julia> s = CreateMorphism( C, 2 )
(C0)-[(s)]->(C1)

julia> t = CreateMorphism( C, 3 )
(C0)-[(t)]->(C1)

julia> IsSplitMonomorphism( s )
true

julia> IsSplitMonomorphism( t )
true

julia> IsEpimorphism( s )
false

julia> IsEpimorphism( t )
false

julia> IsSplitEpimorphism( id )
true

julia> IsMonomorphism( id )
false

julia> idC1 = CreateMorphism( C, 4 )
(C1)-[(C1)]->(C1)

julia> IsOne( idC1 )
true

julia> sigma = CreateMorphism( C, 5 )
(C1)-[(id*s)]->(C1)

julia> tau = CreateMorphism( C, 6 )
(C1)-[(id*t)]->(C1)

julia> IsEndomorphism( sigma )
true

julia> IsMonomorphism( sigma )
false

julia> IsEpimorphism( sigma )
false

julia> IsEndomorphism( tau )
true

julia> IsMonomorphism( tau )
false

julia> IsEpimorphism( tau )
false

julia> IsOne( tau )
false

julia> IsWellDefined( CreateMorphism( C1, 7, C1 ) )
false

julia> PreCompose( s, id ) == idC0
true

julia> PreCompose( t, id ) == idC0
true

julia> PreCompose( id, s ) == sigma
true

julia> PreCompose( id, t ) == tau
true

julia> HomStructure( C0, C0 )
|1|

julia> HomStructure( C1, C1 )
|3|

julia> HomStructure( C0, C1 )
|2|

julia> HomStructure( C1, C0 )
|1|

julia> Display( HomStructure( s ) )
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

julia> Display( HomStructure( t ) )
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

julia> HomStructure( Source( s ), Target( s ), HomStructure( s ) ) == s
true

julia> HomStructure( Source( t ), Target( t ), HomStructure( t ) ) == t
true

julia> Display( HomStructure( s, t ) )
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

julia> Display( HomStructure( t, s ) )
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

julia> Display( HomStructure( sigma, tau ) )
[ 0, 1, 2 ] ⱶ[ 2, 2, 2 ]→ [ 0, 1, 2 ]

julia> Display( HomStructure(
                PreCompose( Delta1.id, Delta1.s ),
                PreCompose( Delta1.id, Delta1.t ) ) )
[ 0, 1, 2 ] ⱶ[ 2, 2, 2 ]→ [ 0, 1, 2 ]

julia> Display( HomStructure( tau, sigma ) )
[ 0, 1, 2 ] ⱶ[ 1, 1, 1 ]→ [ 0, 1, 2 ]

julia> Display( HomStructure(
                PreCompose( Delta1.id, Delta1.t ),
                PreCompose( Delta1.id, Delta1.s ) ) )
[ 0, 1, 2 ] ⱶ[ 1, 1, 1 ]→ [ 0, 1, 2 ]

julia> Display( HomStructure( tau, idC1 ) )
[ 0, 1, 2 ] ⱶ[ 2, 1, 2 ]→ [ 0, 1, 2 ]

julia> Display( HomStructure( idC1, idC1 ) )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> mors = SetOfMorphisms( C )
[ (C0)-[(C0)]->(C0), (C1)-[(id)]->(C0), (C0)-[(s)]->(C1), (C0)-[(t)]->(C1),
  (C1)-[(C1)]->(C1), (C1)-[(id*s)]->(C1), (C1)-[(id*t)]->(C1) ]

julia> List( mors, OppositeMorphismInOppositeCategoryFromDataTables )
[ (C0)-[(C0)]->(C0), (C0)-[(id)]->(C1), (C1)-[(s)]->(C0), (C1)-[(t)]->(C0),
(C1)-[(C1)]->(C1), (C1)-[(s*id)]->(C1), (C1)-[(t*id)]->(C1) ]

julia> mors
[ (C0)-[(C0)]->(C0), (C1)-[(id)]->(C0), (C0)-[(s)]->(C1), (C0)-[(t)]->(C1),
  (C1)-[(C1)]->(C1), (C1)-[(id*s)]->(C1), (C1)-[(id*t)]->(C1) ]

julia> List( mors, DecompositionOfMorphismInCategory )
[ [  ], [ (C1)-[(id)]->(C0) ], [ (C0)-[(s)]->(C1) ], [ (C0)-[(t)]->(C1) ],
  [  ], [ (C1)-[(id)]->(C0), (C0)-[(s)]->(C1) ],
  [ (C1)-[(id)]->(C0), (C0)-[(t)]->(C1) ] ]

julia> C_op = OppositeCategoryFromDataTables( C )
Opposite(
PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
/ [ s⋅id == id(C0), t⋅id == id(C0) ] )

julia> IsIdenticalObj( OppositeCategoryFromDataTables( C_op ), C )
true

julia> IndicesOfGeneratingMorphisms( C_op )
[ 3, 1, 2 ]

julia> SetOfGeneratingMorphisms( C_op )
[ (C0)-[(id)]->(C1), (C1)-[(s)]->(C0), (C1)-[(t)]->(C0) ]

julia> mors_op = SetOfMorphisms( C_op )
[ (C0)-[(C0)]->(C0), (C1)-[(s)]->(C0), (C1)-[(t)]->(C0), (C0)-[(id)]->(C1),
  (C1)-[(C1)]->(C1), (C1)-[(s*id)]->(C1), (C1)-[(t*id)]->(C1) ]

julia> List( mors_op, DecompositionOfMorphismInCategory )
[ [  ], [ (C1)-[(s)]->(C0) ], [ (C1)-[(t)]->(C0) ], [ (C0)-[(id)]->(C1) ],
  [  ], [ (C1)-[(s)]->(C0), (C0)-[(id)]->(C1) ],
  [ (C1)-[(t)]->(C0), (C0)-[(id)]->(C1) ] ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> q = RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" )
q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]

julia> F = FreeCategory( q )
FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" ) )

julia> k = HomalgFieldOfRationals( )
Q

julia> kF = k[F]
Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
e:3->3]" ) ) )

julia> B = kF / [ kF.e^3 ]
Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
e:3->3]" ) ) ) / relations

julia> data_tables = DataTablesOfCategory( B );

julia> data_tables[1]
Q

julia> data_tables[2]
FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" )

julia> data_tables[3]
[[[ [] ], [ [1] ], [ [3] ], [ [1,2],[3,4],[1,2,5],[3,4,5],[1,2,5,5],[3,4,5,5]]],
 [[  ], [ [] ], [  ], [ [2],[2,5],[2,5,5] ]],
 [[  ], [  ], [ [] ], [ [4],[4,5],[4,5,5] ]],
 [[  ], [  ], [  ], [ [],[5],[5,5] ]]]

julia> data_tables[4][2][5]
[ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ]

julia> data_tables[5][4][1]
[ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ] ]

julia> A = AlgebroidFromDataTables( data_tables );; # alternatively,

julia> A = AlgebroidFromDataTables( B )
Q-algebroid( [0,1,2,3][a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] ) defined by
4 objects and 5 generating morphisms

julia> AssignSetOfObjects( A, "V_" )

julia> AssignSetOfGeneratingMorphisms( A )

julia> SetOfObjects( A )
[ <(0)>, <(1)>, <(2)>, <(3)> ]

julia> A["0"]
<(0)>

julia> V_0
<(0)>

julia> IsEqualForObjects( A["0"], V_0 )
true

julia> ObjectConstructor( A, 1 ) == A["0"]
true

julia> SetOfGeneratingMorphisms( A )
[ <1*a:(0) → (1)>, <1*b:(1) → (3)>,
  <1*c:(0) → (2)>, <1*d:(2) → (3)>,
  <1*e:(3) → (3)> ]

julia> IsCongruentForMorphisms( A["a"], a )
true

julia> Perform( [ "V_0", "V_1", "V_2", "V_3" ], MakeReadWriteGlobal )

julia> Perform( [ "a", "b", "c", "d", "e" ], MakeReadWriteGlobal )

julia> HomStructure( A["0"], A["3"] )
<A row module over Q of rank 6>

julia> hom_03 = BasisOfExternalHom( A["0"], A["3"] )
[ <1*a⋅b:(0) → (3)>, <1*c⋅d:(0) → (3)>,
  <1*a⋅b⋅e:(0) → (3)>, <1*c⋅d⋅e:(0) → (3)>,
  <1*a⋅b⋅e^2:(0) → (3)>, <1*c⋅d⋅e^2:(0) → (3)> ]

julia> alpha = 2*hom_03[1] + 3*hom_03[6]
<2*a⋅b + 3*c⋅d⋅e^2:(0) → (3)>

julia> LaTeXOutput( alpha )
"[0]-\\left([2\\cdot [a][b] + 3\\cdot [c][d][e]^[2]]\\right)\\rightarrow[3]"

julia> alpha == MorphismConstructor( A, A["0"], [ 2, 0, 0, 0, 0, 3 ], A["3"] )
true

julia> CoefficientsList( alpha )
[ 2, 0, 0, 0, 0, 3 ]

julia> IndicesOfSupportMorphisms( alpha )
[ 1, 6 ]

julia> CoefficientsOfSupportMorphisms( alpha )
[ 2, 3 ]

julia> SupportMorphisms( alpha )
[ <1*a⋅b:(0) → (3)>, <1*c⋅d⋅e^2:(0) → (3)> ]

julia> DecompositionIndicesOfMorphismInAlgebroid( alpha )
[ [ 2, [ 1, 2 ] ], [ 3, [ 3, 4, 5, 5 ] ] ]

julia> DecompositionOfMorphismInAlgebroid( alpha )
[ [ 2, [ <1*a:(0) → (1)>, <1*b:(1) → (3)> ] ],
  [ 3, [ <1*c:(0) → (2)>, <1*d:(2) → (3)>,
         <1*e:(3) → (3)>, <1*e:(3) → (3)> ] ] ]

julia> A["a⋅b⋅e"]
<1*a⋅b⋅e:(0) → (3)>

julia> A["abe"]
<1*a⋅b⋅e:(0) → (3)>

julia> PreCompose( A["a"], A["b"] ) == A["ab"]
true

julia> U = IsomorphismOntoAlgebroidFromDataTables( B, A )
Isomorphism functor onto algebroid from data tables

julia> V = IsomorphismFromAlgebroidFromDataTables( A, B )
Isomorphism functor from algebroid from data tables

julia> ApplyFunctor( PreCompose( V, U ), alpha ) == alpha
true

julia> V = ExtendFunctorToAdditiveClosures( V )
Extension of Isomorphism functor from algebroid from data tables to
additive closures

julia> add_A = SourceOfFunctor( V )
AdditiveClosure( Q-algebroid( [0,1,2,3][a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] )
defined by 4 objects and 5 generating morphisms )

julia> @IsBound( add_A.precompiled_functions_added )
true

julia> add_B = RangeOfFunctor( V )
AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,
b:1->3,c:0->2,d:2->3,e:3->3]" ) ) ) / relations )

julia> @IsBound( add_B.precompiled_functions_added )
true

julia> o1 =  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );

julia> o2 =  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );

julia> V_o1 = V( o1 );

julia> V_o2 = V( o2 );

julia> s1 = Sum( BasisOfExternalHom( o1, o2 ) );

julia> s2 = Sum( BasisOfExternalHom( V_o1, V_o2 ) );

julia> V( s1 ) == s2
true

julia> f = RandomMorphism( o1, o2, 20 );

julia> g = RandomMorphism( o1, o2, 20 );

julia> V_f = V( f );

julia> V_g = V( g );

julia> m1 = UnderlyingMatrix( HomStructure( f, g ) );

julia> m2 = UnderlyingMatrix( HomStructure( V_f, V_g ) );

julia> m1 == m2
true

julia> IsZero( PreCompose( f, WeakCokernelProjection( f ) ) )
true

julia> IsZero( PreCompose( WeakKernelEmbedding( f ), f ) )
true

julia> freyd_B = FreydCategory( add_A )
Freyd( AdditiveClosure( Q-algebroid( [0,1,2,3][a:0→1,b:1→3,c:0→2,d:2→3,
e:3→3] ) defined by 4 objects and 5 generating morphisms ) )

julia> IsAbelianCategory( freyd_B )
true

julia> A_op = OppositeAlgebroid( A )
Q-algebroid( [0,1,2,3][a:1→0,b:3→1,c:2→0,d:3→2,e:3→3] ) defined by
4 objects and 5 generating morphisms

julia> A_op["ba"]
<1*b⋅a:(3) → (0)>

julia> add_A = AdditiveClosure( A )
AdditiveClosure( Q-algebroid( [0,1,2,3][a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] )
defined by 4 objects and 5 generating morphisms )

julia> T = DirectSum( List( SetOfObjects( A ), o -> o / add_A ) )
<An object in AdditiveClosure( Q-algebroid( [0,1,2,3][a:0→1,b:1→3,c:0→2,
d:2→3,e:3→3] ) defined by 4 objects and 5 generating morphisms ) defined
by 4 underlying objects>

julia> u = RandomMorphism( T, T, 5 );

julia> v = RandomMorphism( T, T, 5 );

julia> w = RandomMorphism( T, T, 5 );

julia> HomStructure( PreCompose( [ u, v, w ] ) )
              == PreCompose( HomStructure( v ), HomStructure( u, w ) )
true

julia> AA = TensorProductOfAlgebroids( A, A )
Q-algebroid( [0⊗0,0⊗1,0⊗2,..,3⊗1,3⊗2,3⊗3][0⊗a:0⊗0→0⊗1,0⊗b:0⊗1→0⊗3,
0⊗c:0⊗0→0⊗2,..,e⊗1:3⊗1→3⊗1,e⊗2:3⊗2→3⊗2,e⊗3:3⊗3→3⊗3] ) defined
by 16 objects and 40 generating morphisms

julia> ElementaryTensor( A.0, A.1 )
<(0⊗1)>

julia> ElementaryTensor( A.a, A.b )
<1*a⊗b:(0⊗1) → (1⊗3)>

julia> ElementaryTensor( A.0, A.b )
<1*id(0)⊗b:(0⊗1) → (0⊗3)>

julia> ElementaryTensor( A.a, A.1 )
<1*a⊗id(1):(0⊗1) → (1⊗1)>

julia> 3x3 = AA["3⊗3"]
<(3⊗3)>

julia> AA["e⊗1"]
<1*e⊗id(1):(3⊗1) → (3⊗1)>

julia> u = RandomMorphism( 3x3, 3x3, 15 );

julia> v = RandomMorphism( 3x3, 3x3, 15 );

julia> w = RandomMorphism( 3x3, 3x3, 15 );

julia> HomStructure( PreCompose( [ u, v, w ] ) )
              == PreCompose( HomStructure( v ), HomStructure( u, w ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> str = "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";

julia> q = FinQuiver( str )
FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
t:4→5,y:5→5]" )

julia> k = HomalgFieldOfRationals( )
Q

julia> C = PathCategory( q; admissible_order = "Dp" )
PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,
b:2→4,d:3→4,t:4→5,y:5→5]" ) )

julia> kC = LinearClosure( k, C ); # || k[C]
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) )

julia> AssignSetOfObjects( kC, "v_" )

julia> AssignSetOfGeneratingMorphisms( kC, "m_" )

julia> rels = [ kC.x^10 - kC.x^5, kC.abt - kC.et, kC.y^10 - kC.y^5, kC.x^5, kC.y^5 ]
[ 1*x^10 + (-1)*x^5:(0) → (0), 1*a⋅b⋅t + (-1)*e⋅t:(1) → (5),
  1*y^10 + (-1)*y^5:(5) → (5), 1*x^5:(0) → (0), 1*y^5:(5) → (5) ]

julia> quo_kC = QuotientCategory( kC, rels ); # || kC / rels
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) ) / [ 1*x^10 + (-1)*x^5,
1*a⋅b⋅t + (-1)*e⋅t, 1*y^10 + (-1)*y^5, ... ]

julia> HomStructure( quo_kC.0, quo_kC.5 )
<A row module over Q of rank 50>

julia> A = AlgebroidFromDataTables( quo_kC )
Q-algebroid( [0,1,2,3,4,5][x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
t:4→5,y:5→5] ) defined by 6 objects and 9 generating morphisms

julia> HomStructure( A.0, A.5 )
<A row module over Q of rank 50>

julia> quo_C = C / [ [ C.x^10, C.x^5 ], [ C.abt, C.et ], [ C.y^10, C.y^5 ] ]
PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,
b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 == x^5, a⋅b⋅t == e⋅t, y^10 == y^5 ]

julia> k_quo_C = k[quo_C]
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 == x^5, a⋅b⋅t == e⋅t,
y^10 == y^5 ] )

julia> quo_k_quo_C = k_quo_C / [ k_quo_C.x^5, k_quo_C.y^5 ]
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3, e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 == x^5, a⋅b⋅t == e⋅t,
y^10 == y^5 ] ) / [ 1*[x^5], 1*[y^5] ]

julia> HomStructure( quo_k_quo_C.0, quo_k_quo_C.5 )
<A row module over Q of rank 50>

julia> Dimension( quo_k_quo_C )
126

julia> ModelingCategory( quo_k_quo_C )
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3, e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) ) / [ 1*x^10 + (-1)*x^5,
1*a⋅b⋅t + (-1)*e⋅t, 1*y^10 + (-1)*y^5, ... ]

julia> B = AlgebroidFromDataTables( quo_k_quo_C )
Q-algebroid( [0,1,2,3,4,5][x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
t:4→5,y:5→5] ) defined by 6 objects and 9 generating morphisms

julia> HomStructure( B.0, B.5 )
<A row module over Q of rank 50>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> k = HomalgFieldOfRationals( )
Q

julia> q = FinQuiver( "q(o)[x:o->o,y:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o]" )

julia> C = PathCategory( q )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )

julia> kC = k[C]
Q-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) )

julia> x = kC.x;

julia> y = kC.y;

julia> rels = [ x*y-y*x, (x^2+y^2)*(x+x*y), (x^2+y^2)*(y^2+x^3) ]
[ (-1)*y⋅x + 1*x⋅y:(o) → (o), 1*x^3⋅y + 1*y^2⋅x⋅y + 1*x^3 + 1*y^2⋅x:(o) → (o),
  1*x^5 + 1*y^2⋅x^3 + 1*x^2⋅y^2 + 1*y^4:(o) → (o) ]

julia> gb = ReducedGroebnerBasis( kC, rels )
[ (-1)*y⋅x + 1*x⋅y:(o) → (o),
  1*x^3⋅y + 1*x⋅y^3 + 1*x^3 + 1*x⋅y^2:(o) → (o),
  1*x^5 + (-1)*x⋅y^4 + 1*x^2⋅y^2 + 1*y^4 + 1*x^3 + 1*x⋅y^2:(o) → (o),
  1*x^2⋅y^3 + 1*y^5 + 1*x^2⋅y^2 + 1*y^4:(o) → (o) ]

julia> f = Sum( gb )
1*x^5 + 1*x^2⋅y^3 + (-1)*x⋅y^4 + 1*y^5 + 1*x^3⋅y + 2*x^2⋅y^2 + 1*x⋅y^3 +
2*y^4 + 2*x^3 + 2*x⋅y^2 + (-1)*y⋅x + 1*x⋅y:(o) → (o)

julia> ReductionOfMorphism( kC, f, rels )
1*x^2⋅y^3 + 1*y^5 + 1*x^2⋅y^2 + 1*y^4:(o) → (o)

julia> ReductionOfMorphism( kC, f, gb )
0:(o) → (o)

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> F = HomalgRingOfIntegersInSingular( 2 )
GF(2)

julia> Alg_F = CategoryOfFpAlgebras( F )
CategoryOfFpAlgebras( GF(2) )

julia> Display( Alg_F )
A CAP category with name CategoryOfFpAlgebras( GF(2) ):

31 primitive operations were used to derive 130 operations for this category which algorithmically
* IsFiniteCocompleteCategory
* IsBicartesianCategory
* IsSymmetricMonoidalCategory

julia> T = TerminalObject( Alg_F )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Display( T )
GF(2) / [ 1*id(o) ]

julia> iota = UniversalMorphismFromInitialObject( T )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> I = Source( iota )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Display( I )
GF(2) / [  ]

julia> Display( iota )
GF(2) / [ 1*id(o) ]
 ^
 |
[  ]
 |
GF(2) / [  ]

julia> K = TensorUnit( Alg_F )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Display( K )
GF(2) / [  ]

julia> K == I
true

julia> q1 = FinQuiver( "q(o)[x:o->o,y:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o]" )

julia> P1 = PathCategory( q1 )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )

julia> L1 = F[P1]
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

julia> A1 = Q1 / Alg_F
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> A1 == ( L1 / Alg_F ) / relations1
true

julia> Dimension( A1 )
6

julia> Display( A1 )
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> unit1 = UniversalMorphismFromInitialObject( A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> Display( unit1 )
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
 ^
 |
[  ]
 |
GF(2) / [  ]

julia> counit1 = Counit( A1, [ 1, 0 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> Display( counit1 )
GF(2) / [  ]
 ^
 |
[ 1*id(o), 0 ]
 |
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

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

julia> Display( comult1 )
GF(2)<a1,a2,a3,a4> / [ 1*a1^2 + 1*a1, 1*a2^3 + 1*a2, 1*a2⋅a1 + 1*a1⋅a2 + 1*a2, ... ]
 ^
 |
[ 1*a2^2⋅a4^2 + 1*a1 + 1*a3 + 1*id(o), 1*a2⋅a4^2 + 1*a2 + 1*a4 ]
 |
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> IsWellDefined( comult1 )
true

julia> q2 = FinQuiver( "q(o)[x:o->o,y:o->o,z:o->o,t:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" )

julia> P2 = PathCategory( q2 )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) )

julia> L2 = F[P2]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) ) )

julia> Q2 = L2 / [ L2.x+L2.y+L2.t+L2.tt-L2.id_o, L2.xx-L2.x, L2.yy-L2.y, L2.xy, L2.yx,
                     L2.zz-L2.t-L2.tt, L2.zz-L2.ttt, L2.zt-L2.ttz, L2.zt+L2.ztt-L2.z,
                     L2.xt+L2.yt, L2.tx+L2.ty ]
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o,z:o→o,t:o→o]" ) ) ) / [ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, 1*y^2 + 1*y, ... ]

julia> A2 = Q2 / Alg_F
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A2 )
6

julia> Display( A2 )
GF(2)<x,y,z,t> / [ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, 1*y^2 + 1*y, ... ]

julia> A12 = TensorProduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A12 )
36

julia> beta = Braiding( A1, A2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> beta_i = BraidingInverse( A1, A2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> alpha = AssociatorLeftToRight( A1, A2, A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> alpha_i = AssociatorRightToLeft( A1, A2, A1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> A1xA2 = DirectProduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A1xA2 )
12

julia> diagram = [ A1, A2 ]
[ <An object in CategoryOfFpAlgebras( GF(2) )>,
  <An object in CategoryOfFpAlgebras( GF(2) )> ]

julia> pr1 = ProjectionInFactorOfDirectProduct( diagram, 1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> pr2 = ProjectionInFactorOfDirectProduct( diagram, 2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> u = UniversalMorphismIntoDirectProduct( [ pr1, pr2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsOne( u )
true

julia> v = TensorProduct( pr1, pr2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> A1uA2 = Coproduct( A1, A2 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> i1 = InjectionOfCofactorOfCoproduct( diagram, 1 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> i2 = InjectionOfCofactorOfCoproduct( diagram, 2 )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> w = UniversalMorphismFromCoproduct( [ i1, i2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsOne( w )
true

julia> cart_fact = LeftCartesianDistributivityFactoring( A1, [ A1, A2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> cocart_expand = LeftCocartesianCodistributivityExpanding( A1, [ A1, A2 ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> F = HomalgRingOfIntegers( 2 )
GF(2)

julia> Alg_F = CategoryOfFpAlgebras( F )
CategoryOfFpAlgebras( GF(2) )

julia> F0 = InitialObject( Alg_F )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Display( F0 )
GF(2) / [  ]

julia> A = DirectProduct( F0, F0 )
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A )
2

julia> B = F0
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> C = F0
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> eta = LeftCocartesianCodistributivityExpanding( A, [ B, C ] )
<A morphism in CategoryOfFpAlgebras( GF(2) )>

julia> IsWellDefined( eta )
true

julia> Dimension( Source( eta ) )
infinity

julia> Dimension( Target( eta ) )
4

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> F = HomalgRingOfIntegersInSingular( 2 )
GF(2)

julia> MatAlg_F = CategoryOfFpMatrixAlgebras( F )
CategoryOfFpMatrixAlgebras( GF(2) )

julia> Display( MatAlg_F )
A CAP category with name CategoryOfFpMatrixAlgebras( GF(2) ):

27 primitive operations were used to derive 76 operations for this category which algorithmically
* IsCategoryWithInitialObject
* IsCartesianCategory
* IsSymmetricMonoidalCategory
and not yet algorithmically
* IsCategoryWithCoequalizers

julia> T = TerminalObject( MatAlg_F )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( T )
GF(2) / [ 1*id(o) ]

A finitely presented matrix algebra with an empty list of matrix generators

julia> iota = UniversalMorphismFromInitialObject( T )
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> I = Source( iota )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( I )
GF(2) / [  ]

A finitely presented matrix algebra with an empty list of matrix generators

julia> Display( iota )
GF(2) / [ 1*id(o) ]
 ^
 |
[  ]
 |
GF(2) / [  ]

julia> K = TensorUnit( MatAlg_F )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( K )
GF(2) / [  ]

A finitely presented matrix algebra with an empty list of matrix generators

julia> K == I
true

julia> Alg_F = UnderlyingCategory( MatAlg_F )
CategoryOfFpAlgebras( GF(2) )

julia> Display( Alg_F )
A CAP category with name CategoryOfFpAlgebras( GF(2) ):

31 primitive operations were used to derive 130 operations for this category which algorithmically
* IsFiniteCocompleteCategory
* IsBicartesianCategory
* IsSymmetricMonoidalCategory

julia> q = FinQuiver( "q(o)[x:o->o,y:o->o]" )
FinQuiver( "q(o)[x:o→o,y:o→o]" )

julia> P = PathCategory( q )
PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )

julia> L = F[P]
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

julia> A = Q / Alg_F
<An object in CategoryOfFpAlgebras( GF(2) )>

julia> Dimension( A )
6

julia> Display( A )
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> Mat_F = UnderlyingCategoryOfMatrices( MatAlg_F )
Rows( GF(2) )

julia> mx = HomalgDiagonalMatrix( [ 1, 0, 1, 0 ], F ) / Mat_F
<A morphism in Rows( GF(2) )>

julia> my = DiagMat( [
                      HomalgZeroMatrix( 2, 2, F ),
                      CertainRows( HomalgIdentityMatrix( 2, F ), [ 2, 1 ] ) ] ) / Mat_F
<A morphism in Rows( GF(2) )>

julia> matrix_generators = PairGAP( 4 / Mat_F, [ mx, my ] )
[ <A row module over GF(2) of rank 4>,  [ <A morphism in Rows( GF(2) )>, <A morphism in Rows( GF(2) )> ] ]

julia> M = ObjectConstructor( MatAlg_F, PairGAP( A, matrix_generators ) )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( M )
1,0,0,0,
0,0,0,0,
0,0,1,0,
0,0,0,0

0,0,0,0,
0,0,0,0,
0,0,0,1,
0,0,1,0

GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

A finitely presented matrix algebra with the above matrix generators

julia> IsWellDefined( M )
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

julia> P = DirectProduct( I, M )
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( P )
1,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0

0,0,0,0,0,
0,1,0,0,0,
0,0,0,0,0,
0,0,0,1,0,
0,0,0,0,0

0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,1,
0,0,0,1,0

0,0,0,0,0,
0,1,0,0,0,
0,0,1,0,0,
0,0,0,1,0,
0,0,0,0,1

GF(2)<a1,a2,a3,a4> / [ 1*a2^2 + 1*a2, 1*a3^3 + 1*a3, 1*a3⋅a2 + 1*a2⋅a3 + 1*a3, ... ]

A finitely presented matrix algebra with the above matrix generators

julia> counit = Counit( M, [ 1, 0 ] )
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( counit )
GF(2) / [  ]
 ^
 |
[ 1*id(o), 0 ]
 |
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> IsWellDefined( counit )
true

julia> o = M.id_o
1*id(o):(o) → (o)

julia> x = M.x
1*x:(o) → (o)

julia> y = M.y
1*y:(o) → (o)

julia> comult = Comultiplication( M,
                          [ [ [ o, x ], [ x, o ], [ o, o ], [ y^2, y^2 ] ],
                            [ [ o, y ], [ y, o + y^2 ] ] ] )
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>

julia> Display( comult )
GF(2)<a1,a2,a3,a4> / [ 1*a1^2 + 1*a1, 1*a2^3 + 1*a2, 1*a2⋅a1 + 1*a1⋅a2 + 1*a2, ... ]
 ^
 |
[ 1*a2^2⋅a4^2 + 1*a1 + 1*a3 + 1*id(o), 1*a2⋅a4^2 + 1*a2 + 1*a4 ]
 |
GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

julia> IsWellDefined( comult )
true

julia> Perform( ListOfMatrixImages( comult ), Display )
Source:
A row module over GF(2) of rank 16

Matrix:
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

Range:
A row module over GF(2) of rank 16

A morphism in Rows( GF(2) )
Source:
A row module over GF(2) of rank 16

Matrix:
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0

Range:
A row module over GF(2) of rank 16

A morphism in Rows( GF(2) )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> q = RightQuiver( "q(0..4)[a:0->0,s:0->1,t:0->1,m:3->0]" )
q(0,1,2,3,4)[a:0->0,s:0->1,t:0->1,m:3->0]

julia> DefiningTripleOfAQuiver( q )
[ 5, 4, [ [ 0, 0 ], [ 0, 1 ], [ 0, 1 ], [ 3, 0 ] ] ]

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> QQ = HomalgFieldOfRationals( );

julia> snake_quiver = RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );

julia> A = PathAlgebra( QQ, snake_quiver );

julia> SetRingFilter( A, IsQuiverAlgebra )

julia> SetRingElementFilter( A, IsQuiverAlgebraElement )

julia> ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" )
true

julia> # only valid for the construction above
        # FIXME: IsInt should be IsRat, but specializations of types are @not yet supported by CompilerForCAP
        CapJitAddTypeSignature( "CoefficientsOfPaths", [ IsList, IsQuiverAlgebraElement ], CapJitDataTypeOfListOf( IsInt ) )

julia> CapJitAddTypeSignature( "HomStructureOnBasisPaths", [ IsAlgebroid ], function ( input_types )
            
            return CapJitDataTypeOfListOf(
                           CapJitDataTypeOfListOf(
                                   CapJitDataTypeOfListOf(
                                           CapJitDataTypeOfListOf(
                                                   CapJitDataTypeOfListOf(
                                                           CapJitDataTypeOfListOf(
                                                                   CapJitDataTypeOfListOf(
                                                                           CapJitDataTypeOfListOf( IsInt ) ) ) ) ) ) ) ); end )

julia> # EXPERIMENTAL
        Add( CAP_JIT_EXPENSIVE_FUNCTION_NAMES, "CoefficientsOfPaths" )

julia> precompile_AdditiveClosureOfAlgebroid =
          function( Rq, over_Z, ring )
            CapJitPrecompileCategoryAndCompareResult(
                EvalString( ReplacedString( """Rq -> AdditiveClosure( Algebroid(
                    Rq, over_Z; FinalizeCategory = true
                ) )""", "over_Z", StringGAP( over_Z ) ) ),
                [ Rq ],
                "Algebroids",
                @Concatenation(
                    "AdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOver",
                    ring,
                    "Precompiled"
                ),
                operations = "primitive"
            ); end;

julia> precompile_AdditiveClosureOfAlgebroid( A, false, "Field" )

julia> precompile_AdditiveClosureOfAlgebroid( A, true, "Z" )

julia> AdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverFieldPrecompiled( A )
AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver(
"q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) )

julia> AdditiveClosure( Algebroid( A, false ) ).precompiled_functions_added
true

julia> AdditiveClosure( Algebroid( A, true ) ).precompiled_functions_added
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" )
true

julia> CapJitAddTypeSignature( "\*", [ IsHomalgRingElement, IsInt ], input_types -> input_types[1] );

julia> category_constructor =
          data_tables -> AdditiveClosure( AlgebroidFromDataTables( ShallowCopy( data_tables ); range_of_HomStructure = CategoryOfRows_as_AdditiveClosure_RingAsCategory( data_tables[1]; FinalizeCategory = true ), FinalizeCategory = true ) );

julia> Q = HomalgFieldOfRationalsInSingular();

julia> q = FinQuiver( "q(*)[x:*->*]" );

julia> given_arguments =
          [ @NTupleGAP( 5,
              # coefficients_ring
              Q,
              # quiver
              q,
              # decomposition_indices_of_bases_elements
              [ [ [ [ ], [ 1 ], [ 1, 1 ] ] ] ],
              # hom_structure_gmors_objs
              [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ],
              # hom_structure_objs_gmors
              [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ] ) ];

julia> compiled_category_name = "AdditiveClosureOfAlgebroidFromDataTablesPrecompiled";

julia> package_name = "Algebroids";

julia> CapJitPrecompileCategoryAndCompareResult(
            category_constructor,
            given_arguments,
            package_name,
            compiled_category_name
           ; operations = "primitive"
            );

julia> A = AdditiveClosureOfAlgebroidFromDataTablesPrecompiled( given_arguments[1] );

julia> A.precompiled_functions_added
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" )
true

julia> QQ = HomalgFieldOfRationals( );

julia> snake_quiver = RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );

julia> A = PathAlgebra( QQ, snake_quiver );

julia> SetRingFilter( A, IsQuiverAlgebra )

julia> SetRingElementFilter( A, IsQuiverAlgebraElement )

julia> ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" )
true

julia> # only valid for the construction above
        # FIXME: IsInt should be IsRat, but specializations of types are @not yet supported by CompilerForCAP
        # this might already have been added by PrecompileAdditiveClosureOfAlgebroid.g
        if (@not @IsBound( CAP_JIT_INTERNAL_TYPE_SIGNATURES.CoefficientsOfPaths ) then CapJitAddTypeSignature( "CoefficientsOfPaths", [ IsList, IsQuiverAlgebraElement ], CapJitDataTypeOfListOf( IsInt ) ); end

julia> if @not @IsBound( CAP_JIT_INTERNAL_TYPE_SIGNATURES.HomStructureOnBasisPaths ))
            CapJitAddTypeSignature( "HomStructureOnBasisPaths", [ IsAlgebroid ], function ( input_types )
                
                return CapJitDataTypeOfListOf(
                               CapJitDataTypeOfListOf(
                                       CapJitDataTypeOfListOf(
                                               CapJitDataTypeOfListOf(
                                                       CapJitDataTypeOfListOf(
                                                               CapJitDataTypeOfListOf(
                                                                       CapJitDataTypeOfListOf(
                                                                               CapJitDataTypeOfListOf( IsInt ) ) ) ) ) ) ) ); end ); end

julia> # EXPERIMENTAL
        Add( CAP_JIT_EXPENSIVE_FUNCTION_NAMES, "CoefficientsOfPaths" )

julia> precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid = function( Rq, over_Z, ring )
            CapJitPrecompileCategoryAndCompareResult(
                EvalString( ReplacedString( """Rq -> AdelmanCategory( AdditiveClosure( Algebroid(
                    Rq, over_Z; FinalizeCategory = true
                ); FinalizeCategory = true ) )""", "over_Z", StringGAP( over_Z ) ) ),
                [ Rq ],
                "Algebroids",
                @Concatenation(
                    "AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOver",
                    ring,
                    "Precompiled"
                ),
                operations = [
                    "IsZeroForMorphisms",
                    "CokernelProjection",
                    "IsDominating",
                    "IsEqualAsSubobjects",
                ]
            ); end;

julia> precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid( A, false, "Field" )

julia> precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid( A, true, "Z" )

julia> AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverFieldPrecompiled( A )
Adelman category( AdditiveClosure( Algebroid( Q, FreeCategory(
RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

julia> AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverZPrecompiled( A )
Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

julia> AdelmanCategory( AdditiveClosure( Algebroid( A, false ) ) ).precompiled_functions_added
true

julia> AdelmanCategory( AdditiveClosure( Algebroid( A, true ) ) ).precompiled_functions_added
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" )
true

julia> category_constructor =
          function( quiver )
            local sFinSets; sFinSets = SkeletalCategoryOfFiniteSets(; FinalizeCategory = true ); return CategoryFromDataTables( FreeCategory( quiver; range_of_HomStructure = sFinSets, FinalizeCategory = true ) ); end;

julia> given_arguments = [ RightQuiver( "q(a,b)[m:a->b]" ) ];

julia> compiled_category_name = "CategoryFromDataTablesPrecompiled";

julia> package_name = "Algebroids";

julia> CapJitPrecompileCategoryAndCompareResult(
            category_constructor,
            given_arguments,
            package_name,
            compiled_category_name
               ; operations = "primitive" );

julia> CategoryFromDataTablesPrecompiled( given_arguments[1] )
FreeCategory( RightQuiver( "q(a,b)[m:a->b]" ) )

julia> CategoryFromDataTables( FreeCategory( given_arguments[1] ) ).precompiled_functions_added
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> quiver = RightQuiver( "Q(8)[a:1->2,b:2->3,c:3->4,d:3->5,e:4->6,f:5->6,g:6->7,h:7->8]" );

julia> QQ = HomalgFieldOfRationals();

julia> A = PathAlgebra( QQ, quiver );

julia> B = QuotientOfPathAlgebra( A,
        [ 
            A.ce - A.df,
            A.abd,
            A.egh,
            A.bc,
            A.fg,
            A.ab #since d is supposed to be a mono 
        ] );

julia> QRowsB = QuiverRowsDescentToZDefinedByBasisPaths( B );

julia> Adel = AdelmanCategory( QRowsB );

julia> a = B.a/QRowsB/Adel;

julia> b = B.b/QRowsB/Adel;

julia> c = B.c/QRowsB/Adel;

julia> d = B.d/QRowsB/Adel;

julia> e = B.e/QRowsB/Adel;

julia> f = B.f/QRowsB/Adel;

julia> g = B.g/QRowsB/Adel;

julia> h = B.h/QRowsB/Adel;

julia> l = CokernelProjection( a );

julia> k = CokernelColift( a, PreCompose( b, d ) );

julia> i = KernelEmbedding( h );

julia> j = KernelLift( h, PreCompose( e, g ) );

julia> Kd = KernelObject( d );

julia> Hbc = HomologyObject( b, c );

julia> Hcj = HomologyObject( c, j );

julia> Hkf = HomologyObject( k, f );

julia> Hfg = HomologyObject( f, g );

julia> L = [ Kd, Hbc, Hcj, Hkf, Hfg ];

julia> K = KernelObject( e );

julia> test_func = MembershipFunctionSerreSubcategoryGeneratedByObjects( L, Adel );
Warning: the provided function returns either true || fail!

julia> C = FullSubcategoryByMembershipFunction( Adel, test_func );

julia> Serre = Adel/C;

julia> K = K/Serre;

julia> IsZero( K )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> true
true

julia> snake_quiver = RightQuiver( "Q(6)[a:1->2,b:2->3,c:1->4,d:2->5,e:3->6,f:4->5,g:5->6]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationalsInSingular(), snake_quiver );

julia> A = kQ / [ kQ.ad - kQ.cf, kQ.dg - kQ.be, kQ.ab, kQ.fg ];

julia> Aoid = Algebroid( kQ, [ kQ.ad - kQ.cf, kQ.dg - kQ.be, kQ.ab, kQ.fg ] );

julia> s = SetOfObjects( Aoid );

julia> m = SetOfGeneratingMorphisms( Aoid );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( -m[3] );

julia> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( m[3] ), Target( m[3] ), interpretation );

julia> ## additive closure
        add = AdditiveClosure( Aoid );

julia> obj1 = AdditiveClosureObject( [ s[1], s[2] ], add );

julia> mor = AdditiveClosureMorphism( obj1, [ [ IdentityMorphism( s[1] ), ZeroMorphism( s[1], s[2] ) ], [ ZeroMorphism( s[2], s[1] ), -IdentityMorphism( s[2] ) ] ], obj1 );

julia> IsWellDefined( mor );

julia> IsCongruentForMorphisms( PreCompose( mor, mor ), IdentityMorphism( obj1 ) );

julia> obj2 = AdditiveClosureObject( [ s[3], s[3] ], add );

julia> id = IdentityMorphism( obj2 );

julia> objs1:= AdditiveClosureObject( [ s[1] ], add );

julia> objs2:= AdditiveClosureObject( [ s[2] ], add );

julia> ids1 = IdentityMorphism( objs1 );

julia> ids2 = IdentityMorphism( objs2 );

julia> HomomorphismStructureOnMorphisms( DirectSumFunctorial( [ ids1, ids2 ] ), ids1 );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );

julia> IsCongruentForMorphisms(
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Target( mor ), interpretation ),
          mor );

julia> a = AsAdditiveClosureMorphism( m[1] );

julia> b = AsAdditiveClosureMorphism( m[2] );

julia> c = AsAdditiveClosureMorphism( m[3] );

julia> d = AsAdditiveClosureMorphism( m[4] );

julia> e = AsAdditiveClosureMorphism( m[5] );

julia> f = AsAdditiveClosureMorphism( m[6] );

julia> g = AsAdditiveClosureMorphism( m[7] );

julia> l = Lift( PreCompose( a, d ), f );

julia> IsCongruentForMorphisms( PreCompose( l, f ), PreCompose( a, d ) )
true

julia> l = Colift( c, PreCompose( a, d ) );

julia> IsCongruentForMorphisms( PreCompose( c, l ), PreCompose( a, d ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> quiver = RightQuiver( "Q(9)[a:1->2,b:2->3,c:1->4,d:2->5,e:3->6,f:4->5,g:5->6,h:4->7,i:5->8,j:6->9,k:7->8,l:8->9,m:2->7,n:3->8]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), quiver );

julia> Aoid = Algebroid( kQ, [ kQ.ad - kQ.cf, 
                                 kQ.dg - kQ.be, 
                                 kQ["fi"] - kQ.hk,
                                 kQ.gj - kQ.il,
                                 kQ.mk + kQ.bn - kQ.di ] );

julia> mm = SetOfGeneratingMorphisms( Aoid );

julia> CapCategorySwitchLogicOff( Aoid );

julia> Acat = AdditiveClosure( Aoid );

julia> a = AsAdditiveClosureMorphism( mm[1] );

julia> b = AsAdditiveClosureMorphism( mm[2] );

julia> c = AsAdditiveClosureMorphism( mm[3] );

julia> d = AsAdditiveClosureMorphism( mm[4] );

julia> e = AsAdditiveClosureMorphism( mm[5] );

julia> f = AsAdditiveClosureMorphism( mm[6] );

julia> g = AsAdditiveClosureMorphism( mm[7] );

julia> h = AsAdditiveClosureMorphism( mm[8] );

julia> i = AsAdditiveClosureMorphism( mm[9] );

julia> j = AsAdditiveClosureMorphism( mm[10] );

julia> k = AsAdditiveClosureMorphism( mm[11] );

julia> l = AsAdditiveClosureMorphism( mm[12] );

julia> m = AsAdditiveClosureMorphism( mm[13] );

julia> n = AsAdditiveClosureMorphism( mm[14] );

julia> Adel = AdelmanCategory( Acat );

julia> A = AdelmanCategoryObject( a, b );

julia> B = AdelmanCategoryObject( f, g );

julia> alpha = AdelmanCategoryMorphism( A, d, B );

julia> IsWellDefined( alpha )
true

julia> IsWellDefined( KernelEmbedding( alpha ) )
true

julia> IsWellDefined( CokernelProjection( alpha ) )
true

julia> T = AdelmanCategoryObject( k, l );

julia> tau = AdelmanCategoryMorphism( B, i, T );

julia> IsZeroForMorphisms( PreCompose( alpha, tau ) )
true

julia> colift = CokernelColift( alpha, tau );

julia> IsWellDefined( colift )
true

julia> IsCongruentForMorphisms( PreCompose( CokernelProjection( alpha ), colift ), tau )
true

julia> lift = KernelLift( tau, alpha );

julia> IsWellDefined( lift )
true

julia> IsCongruentForMorphisms( PreCompose( lift, KernelEmbedding( tau ) ), alpha )
true

julia> IsCongruentForMorphisms( ColiftAlongEpimorphism( CokernelProjection( alpha ), tau ), colift )
true

julia> IsCongruentForMorphisms( LiftAlongMonomorphism( KernelEmbedding( tau ), alpha ), lift )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> ReadPackageOnce( "Algebroids", "examples/SubobjectLatticeFunctions.g" )
true

julia> quiver = RightQuiver( "Q(5)[a:1->2,b:2->3,c:1->4,d:4->5]" );

julia> QQ = HomalgFieldOfRationals();

julia> B = PathAlgebra( QQ, quiver );

julia> aoid = Algebroid( B, true; overhead = false );

julia> RowsB = AdditiveClosure( aoid; overhead = false );

julia> Adel = AdelmanCategory( RowsB; overhead = false );

julia> QuiverRowsB = QuiverRowsDescentToZDefinedByBasisPaths( B; overhead = false );

julia> QuiverAdel = AdelmanCategory( QuiverRowsB; overhead = false );

julia> a = B.a/aoid/RowsB/Adel;

julia> b = B.b/aoid/RowsB/Adel;

julia> c = B.c/aoid/RowsB/Adel;

julia> d = B.d/aoid/RowsB/Adel;

julia> x = KernelEmbedding( a );

julia> y = KernelEmbedding( PreCompose( a, b ) );

julia> z = KernelEmbedding( c );

julia> w = KernelEmbedding(  PreCompose( c, d ) );

julia> gens = [ x, y, z, w ];

julia> start = Runtime( );

julia> Display( Size( GenerateSubobjects( gens ) ) )
18

julia> runtime = Runtime( ) - start;

julia> a = B.a/QuiverRowsB/QuiverAdel;

julia> b = B.b/QuiverRowsB/QuiverAdel;

julia> c = B.c/QuiverRowsB/QuiverAdel;

julia> d = B.d/QuiverRowsB/QuiverAdel;

julia> x = KernelEmbedding( a );

julia> y = KernelEmbedding( PreCompose( a, b ) );

julia> z = KernelEmbedding( c );

julia> w = KernelEmbedding(  PreCompose( c, d ) );

julia> gens = [ x, y, z, w ];

julia> start = Runtime( );

julia> Display( Size( GenerateSubobjects( gens ) ) )
18

julia> runtime_quiver = Runtime( ) - start;

julia> if runtime >= runtime_quiver * 1 / 20 then Display( true ); else Display( runtime ); Display( runtime_quiver ); end
true

julia> if runtime <= runtime_quiver * 2 / 10 then Display( true ); else Display( runtime ); Display( runtime_quiver ); end
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> quiver = RightQuiver( "Q(3)[a:1->2,b:1->2,c:2->3]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), quiver );

julia> # without precompiled code, CategoryOfRows_as_AdditiveClosure_RingAsCategory is
        # used as range of the homomorphism structure which does @not have enough
        # operations for the hom strucutre of AdelmanCategory
        Aoid = Algebroid( kQ; no_precompiled_code = false );

julia> SetIsProjective( DistinguishedObjectOfHomomorphismStructure( Aoid ), true );

julia> mm = SetOfGeneratingMorphisms( Aoid );

julia> CapCategorySwitchLogicOff( Aoid );

julia> Acat = AdditiveClosure( Aoid );

julia> a = AsAdditiveClosureMorphism( mm[1] );

julia> b = AsAdditiveClosureMorphism( mm[2] );

julia> c = AsAdditiveClosureMorphism( mm[3] );

julia> a = AsAdelmanCategoryMorphism( a );

julia> b = AsAdelmanCategoryMorphism( b );

julia> c = AsAdelmanCategoryMorphism( c );

julia> A = Source( a );

julia> B = Target( a );

julia> C = Target( c );

julia> HomomorphismStructureOnObjects( A, C );

julia> HomomorphismStructureOnMorphisms( IdentityMorphism( A ), c );

julia> mor = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a );

julia> int = InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( A, B, mor );

julia> IsCongruentForMorphisms( int, a )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> DeactivateDefaultCaching()

julia> SwitchGeneralizedMorphismStandard( "span" );

julia> snake_quiver = RightQuiver( "Q(6)[a:1->2,b:2->3,c:3->4]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), snake_quiver );

julia> Aoid = Algebroid( kQ, [ kQ.abc ] );

julia> CapCategorySwitchLogicOff( Aoid );

julia> m = SetOfGeneratingMorphisms( Aoid );

julia> a = m[1];

julia> b = m[2];

julia> c = m[3];

julia> add = AdditiveClosure( Aoid );

julia> DisableInputSanityChecks( add );

julia> adelman = AdelmanCategory( add );

julia> a = AsAdditiveClosureMorphism( a );

julia> b = AsAdditiveClosureMorphism( b );

julia> c = AsAdditiveClosureMorphism( c );

julia> aa = AsAdelmanCategoryMorphism( a );

julia> bb = AsAdelmanCategoryMorphism( b );

julia> cc = AsAdelmanCategoryMorphism( c );

julia> dd = CokernelProjection( aa );

julia> ee = CokernelColift( aa, PreCompose( bb, cc ) );

julia> ff = KernelEmbedding( ee );

julia> gg = KernelEmbedding( cc );

julia> hh = KernelLift( cc, PreCompose( aa, bb ) );

julia> ii = CokernelProjection( hh );

julia> fff = AsGeneralizedMorphism( ff );

julia> ddd = AsGeneralizedMorphism( dd );

julia> bbb = AsGeneralizedMorphism( bb );

julia> ggg = AsGeneralizedMorphism( gg );

julia> iii = AsGeneralizedMorphism( ii );

julia> p = PreCompose( [ fff, PseudoInverse( ddd ), bbb, PseudoInverse( ggg ), iii ] );

julia> IsHonest( p )
true

julia> jj = KernelObjectFunctorial( bb, dd, ee );

julia> pp = HonestRepresentative( p );

julia> comp = PreCompose( jj, pp );

julia> IsZero( comp )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> SwitchGeneralizedMorphismStandard( "cospan" );

julia> snake_quiver = RightQuiver( "Q(6)[a:1->2,b:2->3,c:3->4]" );

julia> QQ = HomalgFieldOfRationals();

julia> A = PathAlgebra( QQ, snake_quiver );

julia> A = QuotientOfPathAlgebra( A, [ A.abc ] );

julia> QRowsA = QuiverRows( A );

julia> SetIsProjective( DistinguishedObjectOfHomomorphismStructure( QRowsA ), true );

julia> a = AsQuiverRowsMorphism( A.a, QRowsA );

julia> b = AsQuiverRowsMorphism( A.b, QRowsA );

julia> c = AsQuiverRowsMorphism( A.c, QRowsA );

julia> aa = AsAdelmanCategoryMorphism( a );

julia> bb = AsAdelmanCategoryMorphism( b );

julia> cc = AsAdelmanCategoryMorphism( c );

julia> dd = CokernelProjection( aa );

julia> ee = CokernelColift( aa, PreCompose( bb, cc ) );

julia> ff = KernelEmbedding( ee );

julia> gg = KernelEmbedding( cc );

julia> hh = KernelLift( cc, PreCompose( aa, bb ) );

julia> ii = CokernelProjection( hh );

julia> fff = AsGeneralizedMorphism( ff );

julia> ddd = AsGeneralizedMorphism( dd );

julia> bbb = AsGeneralizedMorphism( bb );

julia> ggg = AsGeneralizedMorphism( gg );

julia> iii = AsGeneralizedMorphism( ii );

julia> p = PreCompose( [ fff, PseudoInverse( ddd ), bbb, PseudoInverse( ggg ), iii ] );

julia> IsHonest( p )
true

julia> jj = KernelObjectFunctorial( bb, dd, ee );

julia> kk = CokernelObjectFunctorial( hh, gg, bb );

julia> pp = HonestRepresentative( p );

julia> comp = PreCompose( jj, pp );

julia> IsZero( comp )
true

julia> comp = PreCompose( pp, kk );

julia> IsZero( comp )
true

julia> homology = function( alpha, beta ) return CokernelObject( LiftAlongMonomorphism( KernelEmbedding( beta ), ImageEmbedding( alpha ) ) ); end;

julia> IsZero( homology( jj, pp ) )
true

julia> IsZero( homology( pp, kk ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> ReadPackage( "Algebroids", "examples/SubobjectLatticeFunctions.g" )
true

julia> quiver = RightQuiver( "Q(4)[a:1->2,b:2->3,c:3->4]" );

julia> QQ = HomalgFieldOfRationals();

julia> A = PathAlgebra( QQ, quiver );

julia> B = QuotientOfPathAlgebra( A, [ A.ab, A.bc ] );

julia> RowsB = QuiverRowsDescentToZDefinedByBasisPaths( B; overhead = false );

julia> Adel = AdelmanCategory( RowsB; overhead = false );

julia> a = B.a/RowsB/Adel;

julia> c = B.c/RowsB/Adel;

julia> F = CokernelObject( a );

julia> G = KernelObject( c );

julia> eta = AdelmanCategoryMorphism( F, B.b/RowsB, G );

julia> C = CokernelObject( eta );

julia> I = ImageObject( eta );

julia> K = KernelObject( eta );

julia> IsImagePreserving( I )
true

julia> IsLeftExact( I )
false

julia> IsRightExact( I )
false

julia> IsMonoPreserving( K )
false

julia> IsEpiPreserving( K )
false

julia> IsMonoPreserving( C )
false

julia> IsEpiPreserving( C )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> ## quiver without relations
        QQ = HomalgFieldOfRationals();

julia> quiver = RightQuiver( "Q(3)[a:1->2,b:1->2,c:2->3]" );

julia> Av = Vertices( quiver );

julia> A = PathAlgebra( QQ, quiver );

julia> a = BasisPaths( CanonicalBasis( A ) );

julia> a = List( a, p -> PathAsAlgebraElement( A, p ) );

julia> zA = Zero( A );

julia> QRowsA = QuiverRows( A );

julia> mat = [ [ a[1], zA ], [ zA, a[6] ], [ a[1], zA ] ];

julia> obj1 = QuiverRowsObject( [ [ Av[1], 1 ], [ Av[2], 1 ], [ Av[1], 1 ] ], QRowsA );

julia> obj2 = QuiverRowsObject( [ [ Av[1], 1 ], [ Av[3], 1 ] ], QRowsA );

julia> alpha = QuiverRowsMorphism( obj1, mat, obj2 );

julia> obj3 = QuiverRowsObject( [ [ Av[2], 1 ] ], QRowsA );

julia> mat = [ [ a[4] ], [ zA ] ];

julia> beta = QuiverRowsMorphism( obj2, mat, obj3 );

julia> pre = PreCompose( alpha, beta );

julia> IsWellDefined( PreCompose( alpha, beta ) )
true

julia> IsZeroForMorphisms( pre )
false

julia> ze = ZeroMorphism( Source( pre ), Target( pre ) );

julia> IsCongruentForMorphisms( pre + ze, pre )
true

julia> IsCongruentForMorphisms( pre + pre, pre )
false

julia> IsZeroForMorphisms( pre - pre )
true

julia> IsCongruentForMorphisms(
            PreCompose(
                UniversalMorphismFromZeroObject( obj1 ),
                UniversalMorphismIntoZeroObject( obj1 )
            ),
            IdentityMorphism( ZeroObject( QRowsA ) )
        )
true

julia> NrSummands( DirectSum( List( (1):(1000), i -> obj1 ) ) ) == 1000 * NrSummands( obj1 )
true

julia> L = [ obj1, obj2, obj3 ];

julia> pi = List( [ 1,2,3 ], i -> ProjectionInFactorOfDirectSum( L, i ) );

julia> iota = List( [ 1,2,3 ], i -> InjectionOfCofactorOfDirectSum( L, i ) );

julia> ForAll( [1,2,3], i ->
            IsCongruentForMorphisms( 
                PreCompose( iota[i], pi[i] ),
                IdentityMorphism( L[i] )
            )
        )
true

julia> IsZeroForMorphisms( PreCompose( iota[2], pi[1] ) )
true

julia> IsCongruentForMorphisms( 
            UniversalMorphismIntoDirectSum( L, pi ),
            IdentityMorphism( DirectSum( L ) )
        )
true

julia> IsCongruentForMorphisms( 
            UniversalMorphismFromDirectSum( L, iota ),
            IdentityMorphism( DirectSum( L ) )
        )
true

julia> IsCongruentForMorphisms(
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( obj1, obj2,
                InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( alpha )
            ),
            alpha
        )
true

julia> ## quiver with relations
        quiver = RightQuiver( 
        "Q(8)[a:1->5,b:2->6,c:3->7,d:4->8,e:1->2,f:2->3,g:3->4,h:5->6,i:6->7,j:7->8]" 
        );

julia> Bv = Vertices( quiver );

julia> QQ = HomalgFieldOfRationals();

julia> kQ = PathAlgebra( QQ, quiver );

julia> B = QuotientOfPathAlgebra( kQ,
        [ 
            kQ.e * kQ.f, kQ.f * kQ.g,
            kQ.h * kQ.i, kQ.i * kQ.j,
            kQ.e * kQ.b - kQ.a * kQ.h,
            kQ.f * kQ.c - kQ.b * kQ.i,
            kQ.g * kQ.d - kQ.c * kQ.j ] 
        );

julia> b = BasisPaths( CanonicalBasis( B ) );

julia> QRowsB = QuiverRows( B );

julia> obj = QuiverRowsObject( [ [ Bv[1], 2 ], [ Bv[1], 4 ], [ Bv[1], 4 ], [ Bv[1], 6 ] ], QRowsB );

julia> IsWellDefined( obj )
true

julia> IdentityMorphism( obj );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> QQ = HomalgFieldOfRationals();

julia> snake_quiver = RightQuiver( "Q(4)[a:1->2,b:2->3,c:3->4]" );

julia> vertices = Vertices( snake_quiver );

julia> A = PathAlgebra( QQ, snake_quiver );

julia> A = QuotientOfPathAlgebra( A, [ A.abc ] );

julia> QRowsA = QuiverRowsDescentToZDefinedByBasisPaths( A );

julia> v1 = AsQuiverRowsObject( vertices[1], QRowsA );

julia> v2 = AsQuiverRowsObject( vertices[2], QRowsA );

julia> mat = [ [ 1/2*A.a ] ];

julia> x = QuiverRowsMorphism( v1, mat, v2 );

julia> IsWellDefined( x )
false

julia> mat = [ [ 2*A.a ] ];

julia> x = QuiverRowsMorphism( v1, mat, v2 );

julia> IsWellDefined( x )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> a = AsQuiverRowsMorphism( A.a, QRowsA );

julia> b = AsQuiverRowsMorphism( A.b, QRowsA );

julia> c = AsQuiverRowsMorphism( A.c, QRowsA );

julia> aa = AsAdelmanCategoryMorphism( a );

julia> bb = AsAdelmanCategoryMorphism( b );

julia> cc = AsAdelmanCategoryMorphism( c );

julia> dd = CokernelProjection( aa );

julia> ee = CokernelColift( aa, PreCompose( bb, cc ) );

julia> ff = KernelEmbedding( ee );

julia> gg = KernelEmbedding( cc );

julia> hh = KernelLift( cc, PreCompose( aa, bb ) );

julia> ii = CokernelProjection( hh );

julia> fff = AsGeneralizedMorphism( ff );

julia> ddd = AsGeneralizedMorphism( dd );

julia> bbb = AsGeneralizedMorphism( bb );

julia> ggg = AsGeneralizedMorphism( gg );

julia> iii = AsGeneralizedMorphism( ii );

julia> p = PreCompose( [ fff, PseudoInverse( ddd ), bbb, PseudoInverse( ggg ), iii ] );

julia> IsHonest( p )
true

julia> jj = KernelObjectFunctorial( bb, dd, ee );

julia> kk = CokernelObjectFunctorial( hh, gg, bb );

julia> pp = HonestRepresentative( p );

julia> comp = PreCompose( jj, pp );

julia> IsZero( comp )
true

julia> comp = PreCompose( pp, kk );

julia> IsZero( comp )
true

julia> homology = function( alpha, beta ) return CokernelObject( LiftAlongMonomorphism( KernelEmbedding( beta ), ImageEmbedding( alpha ) ) ); end;

julia> IsZero( homology( jj, pp ) )
true

julia> IsZero( homology( pp, kk ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> quiver = RightQuiver( "Q(2)[a:1->2]" );

julia> vertices = Vertices( quiver );

julia> B = PathAlgebra( QQ, quiver );

julia> QRowsB = QuiverRows( B );

julia> QRowsB_overZ = QuiverRowsDescentToZDefinedByBasisPaths( B );

julia> a = AsQuiverRowsMorphism( B.a, QRowsB );

julia> a_Z = AsQuiverRowsMorphism( B.a, QRowsB_overZ );

julia> aa = AsAdelmanCategoryMorphism( a );

julia> aa_Z = AsAdelmanCategoryMorphism( a_Z );

julia> bb = aa + aa;

julia> bb_Z = aa_Z + aa_Z;

julia> K1 = KernelEmbedding( bb );

julia> K2 = KernelEmbedding( aa );

julia> IsEqualAsSubobjects( K1, K2 )
true

julia> K1_Z = KernelEmbedding( bb_Z );

julia> K2_Z = KernelEmbedding( aa_Z );

julia> IsEqualAsSubobjects( K1_Z, K2_Z )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> DeactivateDefaultCaching()

julia> SwitchGeneralizedMorphismStandard( "cospan" );

julia> snake_quiver = RightQuiver( "Q(6)[a:1->2,b:2->3,c:1->4,d:2->5,e:3->6,f:4->5,g:5->6]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), snake_quiver );

julia> Aoid = Algebroid( kQ, [ kQ.ad - kQ.cf, kQ.dg - kQ.be, kQ.ab, kQ.fg ] );

julia> m = SetOfGeneratingMorphisms( Aoid );

julia> a = m[1];

julia> b = m[2];

julia> c = m[3];

julia> d = m[4];

julia> e = m[5];

julia> f = m[6];

julia> g = m[7];

julia> cat = Aoid;

julia> CapCategorySwitchLogicOff( cat );

julia> DisableInputSanityChecks( cat );

julia> cat = AdditiveClosure( cat );

julia> DisableInputSanityChecks( cat );

julia> cat = Opposite( cat );

julia> DisableInputSanityChecks( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> CapCategorySwitchLogicOff( Opposite( cat ) );

julia> cat = FreydCategory( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> cat = Opposite( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> af = AsMorphismInFreeAbelianCategory( m[1] );

julia> bf = AsMorphismInFreeAbelianCategory( m[2] );

julia> cf = AsMorphismInFreeAbelianCategory( m[3] );

julia> df = AsMorphismInFreeAbelianCategory( m[4] );

julia> ef = AsMorphismInFreeAbelianCategory( m[5] );

julia> ff = AsMorphismInFreeAbelianCategory( m[6] );

julia> gf = AsMorphismInFreeAbelianCategory( m[7] );

julia> bn = CokernelProjection( af );

julia> en = CokernelColift( af, PreCompose( df, gf ) );

julia> fn = KernelEmbedding( gf );

julia> cn = KernelLift( gf, PreCompose( af, df ) );

julia> ke = KernelEmbedding( en );

julia> co = CokernelProjection( cn );

julia> gk = AsGeneralizedMorphism( ke );

julia> gb = AsGeneralizedMorphism( bn );

julia> gd = AsGeneralizedMorphism( df );

julia> gf = AsGeneralizedMorphism( fn );

julia> gc = AsGeneralizedMorphism( co );

julia> DirectSumFunctorial( [ af, af ] );

julia> IsZero( PreCompose( ke, en ));

julia> timestart = Runtimes().user_time;

julia> p = PreCompose( [ gk, PseudoInverse( gb ) ] );

julia> p2 = PreCompose( p, gd );

julia> p3:= PreCompose( p2, PseudoInverse( gf ) );

julia> p4:= PreCompose( p3, gc );

julia> IsHonest( p )
false

julia> IsHonest( p2 )
false

julia> IsHonest( p3 )
false

julia> IsHonest( p4 )
true

julia> timeend = Runtimes().user_time - timestart;

julia> h = HonestRepresentative( p4 );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> DeactivateDefaultCaching()

julia> SwitchGeneralizedMorphismStandard( "cospan" );

julia> snake_quiver = RightQuiver( "Q(6)[a:1->2,b:2->3,c:3->4]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), snake_quiver );

julia> Aoid = Algebroid( kQ, [ kQ.abc ] );

julia> m = SetOfGeneratingMorphisms( Aoid );

julia> a = m[1];

julia> b = m[2];

julia> c = m[3];

julia> cat = Aoid;

julia> CapCategorySwitchLogicOff( cat );

julia> DisableInputSanityChecks( cat );

julia> cat = AdditiveClosure( cat );

julia> DisableInputSanityChecks( cat );

julia> cat = Opposite( cat );

julia> DisableInputSanityChecks( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> CapCategorySwitchLogicOff( Opposite( cat ) );

julia> cat = FreydCategory( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> cat = Opposite( cat );

julia> CapCategorySwitchLogicOff( cat );

julia> a = AsMorphismInFreeAbelianCategory( a );

julia> b = AsMorphismInFreeAbelianCategory( b );

julia> c = AsMorphismInFreeAbelianCategory( c );

julia> coker_a = CokernelProjection( a );

julia> colift = CokernelColift( a, PreCompose( b, c ) );

julia> ker_c = KernelEmbedding( c );

julia> lift = KernelLift( c, PreCompose( a, b ) );

julia> p = PreCompose( [
          AsGeneralizedMorphism( KernelEmbedding( colift ) ), 
          GeneralizedInverse( coker_a ),
          AsGeneralizedMorphism( b ),
          GeneralizedInverse( ker_c ),
          AsGeneralizedMorphism( CokernelProjection( lift ) )
        ] );

julia> IsHonest( p )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> ReadPackage( "Algebroids", "examples/SubobjectLatticeFunctions.g" )
true

julia> quiver = RightQuiver( "Q(4)[a:1->2,b:2->3,c:1->4]" );

julia> QQ = HomalgFieldOfRationals();

julia> B = PathAlgebra( QQ, quiver );

julia> RowsB = QuiverRowsDescentToZDefinedByBasisPaths( B; overhead = false );

julia> Adel = AdelmanCategory( RowsB; overhead = false );

julia> a = B.a/RowsB/Adel;

julia> b = B.b/RowsB/Adel;

julia> c = B.c/RowsB/Adel;

julia> x = KernelEmbedding( a );

julia> y = KernelEmbedding( PreCompose( a, b ) );

julia> z = KernelEmbedding( c );

julia> gens = [ x, y, z ];

julia> Size( GenerateSubobjects( gens ) )
8

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg, CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FinSetsForCAP, QuotientCategories, FpCategories, LinearClosuresForCAP, FreydCategoriesForCAP, Algebroids

julia> true
true

julia> true
true

julia> quiver = RightQuiver( "Q(9)[a:1->2,b:3->2]" );

julia> kQ = PathAlgebra( HomalgFieldOfRationals(), quiver );

julia> Aoid = Algebroid( kQ );

julia> mm = SetOfGeneratingMorphisms( Aoid );

julia> CapCategorySwitchLogicOff( Aoid );

julia> Acat = AdditiveClosure( Aoid );

julia> a = AsAdditiveClosureMorphism( mm[1] );

julia> b = AsAdditiveClosureMorphism( mm[2] );

julia> a = AsAdelmanCategoryMorphism( a );

julia> b = AsAdelmanCategoryMorphism( b );

julia> pi1 = ProjectionInFactorOfFiberProduct( [ a, b ], 1 );

julia> pi2 = ProjectionInFactorOfFiberProduct( [ a, b ], 1 );

julia> c = CokernelColift( pi1, PreCompose( a, CokernelProjection( b ) ) );

julia> IsMonomorphism( c )
true

```
