
##
InstallMethod( ObjectConstructor,
          [ IsFinQuiver, IsInt ],
  function( q, i )
    return ObjectConstructor( q, BigInt(i) );
end );

##
InstallMethod( MorphismConstructor,
          [ IsFinQuiver, IsFinQuiverObject, IsInt, IsFinQuiverObject ],
  function( q, source, m, range )
    return MorphismConstructor( q, source, BigInt( m ), range );
end );

##
InstallMethod( CreateObject,
          [ IsCategoryFromNerveData, IsInt ],
  function( C, i )
    return CreateObject( C, BigInt( i ) );
end );

##
InstallMethod( CreateMorphism,
          [ IsObjectInCategoryFromNerveData, IsInt, IsObjectInCategoryFromNerveData ],
  function( source, m, range )
    return CreateMorphism( source, BigInt( m ), range );
end );

##
InstallMethod( CreateMorphism,
          [ IsCategoryFromNerveData, IsInt ],
  function( C, m )
    return CreateMorphism( C, BigInt( m ) );
end );


##
InstallMethod( /,
        [ IsInt, IsCategoryFromNerveData ],
  function( i, C )
    return CreateObject( C, i );
end );

##
InstallMethod( CreateObject,
          [ IsCategoryFromDataTables, IsInt ],
  function( C, i )
    return CreateObject( C, BigInt( i ) );
end );

##
InstallMethod( CreateMorphism,
          [ IsObjectInCategoryFromDataTables, IsInt, IsObjectInCategoryFromDataTables ],
  function( source, m, range )
    return CreateMorphism( source, BigInt( m ), range );
end );

##
InstallMethod( CreateMorphism,
          [ IsCategoryFromDataTables, IsInt ],
  function( C, m )
    return CreateMorphism( C, BigInt( m ) );
end );


##
InstallMethod( /,
        [ IsInt, IsCategoryFromDataTables ],
  function( i, C )
    return CreateObject( C, i );
end );

# For doctests you pass mod = @__MODULE__ explicitly at the call site, where the macro expands to the doctest sandbox correctly.
##
function AssignSetOfObjects( C, label::String = ""; mod::Module = Main )
    if !HasUnderlyingQuiver( C )
        error( "the category does not have the attribute 'UnderlyingQuiver'" )
    end
    names = LabelsOfObjects( UnderlyingQuiver( C ) )
    if label == "" && any( name -> tryparse( Int, string( name ) ) !== nothing, names )
        error( "the <label> passed to 'AssignSetOfObjects' must be a non-empty string!" )
    end
    for (name, o) in zip( names, SetOfObjects( C ) )
        varname = Symbol( label * replace( string( name ), "-" => "m" ) )
        Core.eval( mod, :( $(varname) = $(o) ) )
    end
end

##
function AssignSetOfGeneratingMorphisms( C, label::String = ""; mod::Module = Main )
    if !HasUnderlyingQuiver( C )
        error( "the category does not have the attribute 'UnderlyingQuiver'" )
    end
    names = LabelsOfMorphisms( UnderlyingQuiver( C ) )
    if label == "" && any( name -> tryparse( Int, string( name ) ) !== nothing, names )
        error( "the <label> passed to 'AssignSetOfGeneratingMorphisms' must be a non-empty string!" )
    end
    morphisms = SetOfGeneratingMorphisms( C )
    for (name, m) in zip( names, morphisms )
        varname = Symbol( label * replace( string( name ), "-" => "m" ) )
        Core.eval( mod, :( $(varname) = $(m) ) )
    end
end
