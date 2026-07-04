# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
@InstallMethod( FiniteColimitCompletionWithStrictCoproducts,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local UC, CoequalizerPairs,
          name, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ColimitCompletion;
    
    ## building the categorical tower:
    
    UC = EnrichmentSpecificFiniteStrictCoproductCompletion( C; FinalizeCategory = true );
    
    CoequalizerPairs = CoequalizerPreCompletion( UC; FinalizeCategory = true );
    
    ##
    name = @Concatenation( "FiniteColimitCompletionWithStrictCoproducts( ", Name( C ), " )" );
    
    ##
    category_filter = IsFiniteColimitCompletionWithStrictCoproducts;
    category_object_filter = IsObjectInFiniteColimitCompletionWithStrictCoproducts;
    category_morphism_filter = IsMorphismInFiniteColimitCompletionWithStrictCoproducts;
    
    ##
    object_datum_type =
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfObjectOfCategory( UC ),
                      CapJitDataTypeOfObjectOfCategory( UC ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfMorphismOfCategory( UC ),
                      CapJitDataTypeOfMorphismOfCategory( UC ) ) );
    
    ##
    object_constructor =
      function( ColimitCompletion, pair_of_pairs )
        
        return CreateCapCategoryObjectWithAttributes( ColimitCompletion,
                       PairOfObjectsAndPairOfParallelMorphisms, pair_of_pairs );
        
    end;
    
    ##
    object_datum = ( ColimitCompletion, o ) -> PairOfObjectsAndPairOfParallelMorphisms( o );
    
    ##
    morphism_datum_type =
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfMorphismOfCategory( UC ),
              CapJitDataTypeOfMorphismOfCategory( UC ) );
    
    ##
    morphism_constructor =
      function( ColimitCompletion, source, pair_of_morphisms, target )
        
        return CreateCapCategoryMorphismWithAttributes( ColimitCompletion,
                       source,
                       target,
                       DefiningPairOfMorphismBetweenCoequalizerPairs, pair_of_morphisms );
        
    end;
    
    ##
    morphism_datum = ( ColimitCompletion, m ) -> DefiningPairOfMorphismBetweenCoequalizerPairs( m );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor =
      function( ColimitCompletion, pair_of_pairs )
        local CoequalizerPairs;
        
        CoequalizerPairs = ModelingCategory( ColimitCompletion );
        
        return ObjectConstructor( CoequalizerPairs,
                       pair_of_pairs );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum =
      function( ColimitCompletion, obj )
        local CoequalizerPairs;
        
        CoequalizerPairs = ModelingCategory( ColimitCompletion );
        
        return ObjectDatum( CoequalizerPairs,
                       obj );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor =
      function( ColimitCompletion, source, pair, target )
        local CoequalizerPairs;
        
        CoequalizerPairs = ModelingCategory( ColimitCompletion );
        
        return MorphismConstructor( CoequalizerPairs,
                       source,
                       pair,
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum =
      function( ColimitCompletion, mor )
        local CoequalizerPairs;
        
        CoequalizerPairs = ModelingCategory( ColimitCompletion );
        
        return MorphismDatum( CoequalizerPairs,
                       mor );
        
    end;
    
    ##
    ColimitCompletion =
      ReinterpretationOfCategory( CoequalizerPairs,
              @rec( name = name,
                   category_filter = category_filter,
                   category_object_filter = category_object_filter,
                   category_morphism_filter = category_morphism_filter,
                   object_datum_type = object_datum_type,
                   morphism_datum_type = morphism_datum_type,
                   object_constructor = object_constructor,
                   object_datum = object_datum,
                   morphism_constructor = morphism_constructor,
                   morphism_datum = morphism_datum,
                   modeling_tower_object_constructor = modeling_tower_object_constructor,
                   modeling_tower_object_datum = modeling_tower_object_datum,
                   modeling_tower_morphism_constructor = modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum = modeling_tower_morphism_datum,
                   only_primitive_operations = true )
             ; FinalizeCategory = false );
    
    SetUnderlyingCategory( ColimitCompletion, C );
    SetFiniteStrictCoproductCompletionOfUnderlyingCategory( ColimitCompletion, UC );
    
    Append( ColimitCompletion.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              "FiniteStrictCoproductCompletionOfUnderlyingCategory",
              "CategoryOfColimitQuiversOfUnderlyingCategory",
              "CategoryOfPreSheavesOfUnderlyingCategory",
              ] );
    
    if (ValueOption( "no_precompiled_code" ) != true)
        
    end;
    
    Finalize( ColimitCompletion );
    
    return ColimitCompletion;
    
end );

##
@InstallMethod( AsColimitCompletionObject,
        "for a coequalizer closure category and a category object",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryObject ],
        
  function( C_hat, object )
    local C, UC, I, Y, u;
    
    C = UnderlyingCategory( C_hat );
    
    if (@not IsIdenticalObj( C, CapCategory( object ) ))
        Error( "the 2nd argument `object` does not lie in the category UnderlyingCategory( C_hat )\n" );
    end;
    
    UC = FiniteStrictCoproductCompletionOfUnderlyingCategory( C_hat );
    
    I = InitialObject( UC );
    
    Y = EmbeddingOfUnderlyingCategory( UC );
    
    u = UniversalMorphismFromInitialObjectWithGivenInitialObject( UC,
                 Y( object ),
                 I );
    
    return ObjectConstructor( C_hat,
                   PairGAP( PairGAP( Y( object ), I ),
                         PairGAP( u, u ) ) );
    
end );

##
@InstallMethod( AsColimitCompletionMorphism,
        "for a coequalizer closure category and a category morphism",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryMorphism ],
        
  function( C_hat, morphism )
    local C, UC, id, Y;
    
    C = UnderlyingCategory( C_hat );
    
    if (@not IsIdenticalObj( C, CapCategory( morphism ) ))
        Error( "the 2nd argument `morphism` does not lie in the category UnderlyingCategory( C_hat )\n" );
    end;
    
    UC = FiniteStrictCoproductCompletionOfUnderlyingCategory( C_hat );
    
    id = IdentityMorphism( UC, InitialObject( UC ) );
    
    Y = EmbeddingOfUnderlyingCategory( UC );
    
    return MorphismConstructor( C_hat,
                   AsColimitCompletionObject( C_hat, Source( morphism ) ),
                   PairGAP( Y( morphism ), id ),
                   AsColimitCompletionObject( C_hat, Target( morphism ) ) );
    
end );

##
@InstallMethod( /,
        "for a string and a coequalizer closure category",
        [ IsString, IsFiniteColimitCompletionWithStrictCoproducts ],
        
  function( name, C_hat )
    local C, Yc;
    
    C = UnderlyingCategory( C_hat );
    
    Yc = C[name];
    
    if (IsCapCategoryObject( Yc ))
        
        Yc = AsColimitCompletionObject( C_hat, Yc );
        
        SetIsProjective( Yc, true );
        
    elseif (IsCapCategoryMorphism( Yc ))
        
        Yc = AsColimitCompletionMorphism( C_hat, Yc );
        
        if (CanCompute( C_hat, "IsMonomorphism" ))
            IsMonomorphism( Yc );
        end;
        
        if (CanCompute( C_hat, "IsSplitMonomorphism" ))
            IsSplitMonomorphism( Yc );
        end;
        
        if (CanCompute( C_hat, "IsEpimorphism" ))
            IsEpimorphism( Yc );
        end;
        
        if (CanCompute( C_hat, "IsSplitEpimorphism" ))
            IsSplitEpimorphism( Yc );
        end;
        
        ## IsIsomorphism == IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if (CanCompute( C_hat, "IsIsomorphism" ))
            IsIsomorphism( Yc );
        end;
        
    end;
    
    return Yc;
    
end );

#= comment for Julia
INSTALL_DOT_METHOD( IsFiniteColimitCompletionWithStrictCoproducts );
# =#

##
@InstallMethod( /,
        "for a string and an object in a category of coequalizer pairs",
        [ IsString, IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( name, obj )
    local pair;
    
    pair = ObjectDatum( obj );
    
    if (name == "V")
        return pair[1][1];
    elseif (name == "A")
        return pair[1][2];
    elseif (name == "s")
        return pair[2][1];
    elseif (name == "t")
        return pair[2][2];
    end;
    
    Error( "obj has no component with the name \"", name, "\"\n" );
    
end );

#= comment for Julia
##
@InstallMethod( \.,
        "for an object in a category of coequalizer pairs and a positive integer",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts, IsPosInt ],
        
  function ( obj, string_as_int )
    
    return NameRNam( string_as_int ) / obj;
    
end );
# =#

##
@InstallMethod( /,
        "for a string and a morphism in a category of coequalizer pairs",
        [ IsString, IsMorphismInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( name, mor )
    local datum;
    
    datum = MorphismDatum( mor );
    
    if (name == "V")
        return datum[1];
    elseif (name == "A")
        return datum[2];
    end;
    
    Error( "mor has no component with the name \"", name, "\"\n" );
    
end );

#= comment for Julia
##
@InstallMethod( \.,
        "for a morphism in a category of coequalizer pairs and a positive integer",
        [ IsMorphismInFiniteColimitCompletionWithStrictCoproducts, IsPosInt ],
        
  function ( mor, string_as_int )
    
    return NameRNam( string_as_int ) / mor;
    
end );
# =#

##
@InstallMethod( CategoryOfColimitQuiversOfUnderlyingCategory,
        [ IsFiniteColimitCompletionWithStrictCoproducts ],
        
  function( C_hat )
    
    return CategoryOfColimitQuivers( UnderlyingCategory( C_hat ) );
    
end );

##
@InstallMethod( CategoryOfPreSheavesOfUnderlyingCategory,
        [ IsFiniteColimitCompletionWithStrictCoproducts ],
        
  function( C_hat )
    
    return PreSheaves( UnderlyingCategory( C_hat ) );
    
end );

##
@InstallMethod( AssociatedColimitQuiver,
        "for the category of finite colimit completion of a category and an object therein",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function( ColimitCompletionC, coequalizer_object )
    local ColimitQuiversC, Coeq, Quot;
    
    ColimitQuiversC = CategoryOfColimitQuiversOfUnderlyingCategory( ColimitCompletionC );
    
    Coeq = ModelingCategory( ColimitCompletionC );
    
    Quot = ModelingCategory( Coeq );
    
    return ReinterpretationOfObject( ColimitQuiversC,
                   ObjectDatum( Quot,
                           ModelingObject( Coeq,
                                   ModelingObject( ColimitCompletionC,
                                           coequalizer_object ) ) ) );
    
end );

##
@InstallMethod( AssociatedColimitQuiver,
        "for an object in the category of finite colimit completion of a category",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function( coequalizer_object )
    
    return AssociatedColimitQuiver( CapCategory( coequalizer_object ), coequalizer_object );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
@InstallMethod( DisplayString,
        "for an object in the category of coequalizer pairs of a category",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( parallel_pair )
    local C_hat, PSh;
    
    C_hat = CapCategory( parallel_pair );
    
    PSh = ModelingCategory( AmbientCategory( ModelingCategory( ModelingCategory( C_hat ) ) ) );
    
    return @Concatenation( DisplayString( ObjectConstructor( PSh, ObjectDatum( parallel_pair ) ) ), "\nAn object in ", Name( C_hat ), " given by the above data\n" );
    
end );

##
@InstallMethod( DisplayString,
        "for a morphism in the category of coequalizer pairs of a category",
        [ IsMorphismInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( parallel_pair_morphism )
    local C_hat, PSh, source, target;
    
    C_hat = CapCategory( parallel_pair_morphism );
    
    PSh = ModelingCategory( AmbientCategory( ModelingCategory( ModelingCategory( C_hat ) ) ) );
    
    source = ObjectConstructor( PSh, ObjectDatum( Source( parallel_pair_morphism ) ) );
    target = ObjectConstructor( PSh, ObjectDatum( Target( parallel_pair_morphism ) ) );
    
    return @Concatenation( DisplayString( MorphismConstructor( PSh, source, MorphismDatum( parallel_pair_morphism ), target ) ), "\nA morphism in ", Name( C_hat ), " given by the above data\n" );
    
end );
