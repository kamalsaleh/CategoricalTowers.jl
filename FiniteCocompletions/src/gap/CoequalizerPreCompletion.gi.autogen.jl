# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
@InstallMethod( CoequalizerPreCompletion,
        "for a cocartesian CAP category",
        [ IsCapCategory ],
        
  @FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, C )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ParallelPairs, CoequalizerPairs, congruence_func,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          CoequalizerPreCompletion;
    
    if (!(HasIsCocartesianCategory( C ) && IsCocartesianCategory( C )))
        TryNextMethod( );
    end;
    
    if (@not MissingOperationsForConstructivenessOfCategory( C, "IsCocartesianCategory" ) == [ ])
        Error( "the given category `C` must be algorithmically cocartesian\n" );
    end;
    
    ##
    name = @Concatenation( "CoequalizerPreCompletion( ", Name( C ), " )" );
    
    ##
    category_filter = IsCoequalizerPreCompletion;
    category_object_filter = IsObjectInCoequalizerPreCompletion;
    category_morphism_filter = IsMorphismInCoequalizerPreCompletion;
    
    ##
    object_datum_type =
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfObjectOfCategory( C ),
                      CapJitDataTypeOfObjectOfCategory( C ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfMorphismOfCategory( C ),
                      CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
    object_constructor =
      function( CoequalizerPreCompletion, pair_of_pairs )
        
        return CreateCapCategoryObjectWithAttributes( CoequalizerPreCompletion,
                       PairOfObjectsAndPairOfParallelMorphisms, pair_of_pairs );
        
    end;
    
    object_datum = ( CoequalizerPreCompletion, o ) -> PairOfObjectsAndPairOfParallelMorphisms( o );
    
    ##
    morphism_datum_type =
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfMorphismOfCategory( C ),
              CapJitDataTypeOfMorphismOfCategory( C ) );
    
    morphism_constructor =
      function( CoequalizerPreCompletion, source, pair_of_morphisms, target )
        
        return CreateCapCategoryMorphismWithAttributes( CoequalizerPreCompletion,
                       source,
                       target,
                       DefiningPairOfMorphismBetweenCoequalizerPairs, pair_of_morphisms );
        
    end;
    
    morphism_datum = ( CoequalizerPreCompletion, m ) -> DefiningPairOfMorphismBetweenCoequalizerPairs( m );
    
    ## building the categorical tower:
    
    ParallelPairs = PairOfParallelArrowsCategory( C; FinalizeCategory = true );
    
    congruence_func =
      function( a, b )
        
        if (IsEqualForMorphismsOnMor( ParallelPairs, a, b ))
            return true;
        else
            Error( "not implemented\n" );
        end;
        
    end;
    
    CoequalizerPairs =
      QuotientCategory(
              @rec( underlying_category = ParallelPairs,
                   nr_arguments_of_congruence_func = 2,
                   congruence_func = congruence_func,
                   extra_properties = [ "IsFiniteCocompleteCategory" ] )
             ; FinalizeCategory = false );
    
    AddCoequalizer( CoequalizerPairs,
      function( CoequalizerPairs, target, parallel_morphisms )
        local n, ParallelPairs, C, target_VAst, target_V, target_A, target_s, target_t,
              parallel_morphisms_V, diagram_nS, nS, S, id_S,
              diagram_V, diagram_A, V, A, ones, mors, s, t;
        
        n = Length( parallel_morphisms );
        
        if (n == 0)
            return target;
        end;
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        C = UnderlyingCategory( ParallelPairs );
        
        target_VAst = ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, target ) );
        
        target_V = target_VAst[1][1];
        target_A = target_VAst[1][2];
        target_s = target_VAst[2][1];
        target_t = target_VAst[2][2];
        
        parallel_morphisms_V = List( parallel_morphisms, mor ->
                                      MorphismDatum( ParallelPairs,
                                              MorphismDatum( CoequalizerPairs, mor ) )[1] );
        
        diagram_nS = List( parallel_morphisms_V, Source );
        nS = Coproduct( C, diagram_nS );
        
        S = diagram_nS[1];
        id_S = IdentityMorphism( C, S );
        
        diagram_V = [ target_V, S ];
        diagram_A = [ target_A, nS ];
        
        V = Coproduct( C, diagram_V );
        A = Coproduct( C, diagram_A );
        
        ones = UniversalMorphismFromCoproductWithGivenCoproduct( C,
                        diagram_nS,
                        S,
                        ListWithIdenticalEntries( n, id_S ),
                        nS );
        
        mors = UniversalMorphismFromCoproductWithGivenCoproduct( C,
                        diagram_nS,
                        target_V,
                        parallel_morphisms_V,
                        nS );
        
        s = CoproductFunctorialWithGivenCoproducts( C,
                     A,
                     diagram_A,
                     [ target_s, ones ],
                     diagram_V,
                     V );
        
        t = PreCompose( C,
                     UniversalMorphismFromCoproductWithGivenCoproduct( C,
                             diagram_A,
                             target_V,
                             [ target_t, mors ],
                             A ),
                     InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                             diagram_V,
                             1,
                             V ) );
        
        return ObjectConstructor( CoequalizerPairs,
                       ObjectConstructor( ParallelPairs,
                               PairGAP( PairGAP( V, A ), PairGAP( s, t ) ) ) );
        
    end );
    
    AddProjectionOntoCoequalizerWithGivenCoequalizer( CoequalizerPairs,
      function( CoequalizerPairs, target, parallel_morphisms, coequalizer )
        local n, ParallelPairs, C, target_VAst, target_V, target_A, parallel_morphisms_V, diagram_nS, nS, S,
              diagram_V, diagram_A, coequalizer_VAst, coequalizer_V, coequalizer_A, V, A;
        
        n = Length( parallel_morphisms );
        
        if (n == 0)
            return IdentityMorphism( CoequalizerPairs, target );
        end;
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        C = UnderlyingCategory( ParallelPairs );
        
        target_VAst = ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, target ) );
        
        target_V = target_VAst[1][1];
        target_A = target_VAst[1][2];
        
        parallel_morphisms_V = List( parallel_morphisms, mor ->
                                      MorphismDatum( ParallelPairs,
                                              MorphismDatum( CoequalizerPairs, mor ) )[1] );
        
        diagram_nS = List( parallel_morphisms_V, Source );
        nS = Coproduct( C, diagram_nS );
        
        S = diagram_nS[1];
        
        diagram_V = [ target_V, S ];
        diagram_A = [ target_A, nS ];
        
        coequalizer_VAst = ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, coequalizer ) );
        
        coequalizer_V = coequalizer_VAst[1][1];
        coequalizer_A = coequalizer_VAst[1][2];
        
        V = InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                     diagram_V,
                     1,
                     coequalizer_V );
        
        A = InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                     diagram_A,
                     1,
                     coequalizer_A );
        
        return MorphismConstructor( CoequalizerPairs,
                       target,
                       MorphismConstructor( ParallelPairs,
                               ObjectDatum( CoequalizerPairs, target ),
                               PairGAP( V, A ),
                               ObjectDatum( CoequalizerPairs, coequalizer ) ),
                       coequalizer );
        
    end );
    
    Finalize( CoequalizerPairs; FinalizeCategory = true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor =
      function( CoequalizerPreCompletion, pair_of_pairs )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs = ModelingCategory( CoequalizerPreCompletion );
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        return ObjectConstructor( CoequalizerPairs,
                       ObjectConstructor( ParallelPairs,
                               pair_of_pairs ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum =
      function( CoequalizerPreCompletion, obj )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs = ModelingCategory( CoequalizerPreCompletion );
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        return ObjectDatum( ParallelPairs,
                       ObjectDatum( CoequalizerPairs,
                               obj ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor =
      function( CoequalizerPreCompletion, source, pair, target )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs = ModelingCategory( CoequalizerPreCompletion );
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        return MorphismConstructor( CoequalizerPairs,
                       source,
                       MorphismConstructor( ParallelPairs,
                               ObjectDatum( CoequalizerPairs, source ),
                               pair,
                               ObjectDatum( CoequalizerPairs, target ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum =
      function( CoequalizerPreCompletion, mor )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs = ModelingCategory( CoequalizerPreCompletion );
        
        ParallelPairs = AmbientCategory( CoequalizerPairs );
        
        return MorphismDatum( ParallelPairs,
                       MorphismDatum( CoequalizerPairs,
                               mor ) );
        
    end;
    
    ##
    CoequalizerPreCompletion =
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
    
    SetUnderlyingCategory( CoequalizerPreCompletion, C );
    
    Append( CoequalizerPreCompletion.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              ] );
    
    if (ValueOption( "no_precompiled_code" ) != true)
        
    end;
    
    if (FinalizeCategory)
        Finalize( CoequalizerPreCompletion );
    end;
    
    return CoequalizerPreCompletion;
    
end ) );

##
@InstallMethod( EmbeddingOfUnderlyingCategoryData,
        "for a coequalizer completion category",
        [ IsCoequalizerPreCompletion ],
        
  function( Coeq )
    local C, embedding_on_objects, embedding_on_morphisms;
    
    C = UnderlyingCategory( Coeq );
    
    embedding_on_objects =
      function( objC )
        local I, u;
        
        if (@not IsIdenticalObj( C, CapCategory( objC ) ))
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "the 2nd argument `objC` does not lie in the category UnderlyingCategory( Coeq )\n" );
        end;
        
        I = InitialObject( C );
        
        u = UniversalMorphismFromInitialObjectWithGivenInitialObject( C, objC, I );
        
        return ObjectConstructor( Coeq,
                       PairGAP( PairGAP( objC, I ), PairGAP( u, u ) ) );
        
    end;
    
    embedding_on_morphisms =
      function( source, morC, target )
        local id;
        
        if (@not IsIdenticalObj( C, CapCategory( morC ) ))
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "the 2nd argument `morC` does not lie in the category UnderlyingCategory( Coeq )\n" );
        end;
        
        id = IdentityMorphism( C, InitialObject( C ) );
        
        return MorphismConstructor( Coeq,
                       embedding_on_objects( Source( morC ) ),
                       PairGAP( morC, id ),
                       embedding_on_objects( Target( morC ) ) );
        
    end;
    
    return Triple( C,
                   PairGAP( embedding_on_objects, embedding_on_morphisms ),
                   Coeq );
    
end );

##
@InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a coequalizer completion category",
        [ IsCoequalizerPreCompletion ],
        
  function( Coeq )
    local data, Y;
    
    data = EmbeddingOfUnderlyingCategoryData( Coeq );
    
    Y = CapFunctor( "Embedding functor into a coequalizer cocompletion category", data[1], Coeq );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
@InstallMethod( /,
        "for a string and a coequalizer completion category",
        [ IsString, IsCoequalizerPreCompletion ],
        
  function( name, Coeq )
    local C, Y, Yc;
    
    C = UnderlyingCategory( Coeq );
    
    Y = EmbeddingOfUnderlyingCategory( Coeq );
    
    Yc = Y( C[name] );
    
    if (IsObjectInCoequalizerPreCompletion( Yc ))
        
        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elseif (IsMorphismInCoequalizerPreCompletion( Yc ))
        
        if (CanCompute( Coeq, "IsMonomorphism" ))
            IsMonomorphism( Yc );
        end;
        
        if (CanCompute( Coeq, "IsSplitMonomorphism" ))
            IsSplitMonomorphism( Yc );
        end;
        
        if (CanCompute( Coeq, "IsEpimorphism" ))
            IsEpimorphism( Yc );
        end;
        
        if (CanCompute( Coeq, "IsSplitEpimorphism" ))
            IsSplitEpimorphism( Yc );
        end;
        
        ## IsIsomorphism == IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if (CanCompute( Coeq, "IsIsomorphism" ))
            IsIsomorphism( Yc );
        end;
        
    end;
    
    return Yc;
    
end );

#= comment for Julia
##
@InstallMethod( \.,
        "for a coequalizer completion category and a positive integer",
        [ IsCoequalizerPreCompletion, IsPosInt ],
        
  function( Coeq, string_as_int )
    
    return NameRNam( string_as_int ) / Coeq;
    
end );
# =#

##
@InstallMethod( /,
        "for a string and an object in a category of coequalizer pairs",
        [ IsString, IsObjectInCoequalizerPreCompletion ],
        
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
        [ IsObjectInCoequalizerPreCompletion, IsPosInt ],
        
  function ( obj, string_as_int )
    
    return NameRNam( string_as_int ) / obj;
    
end );
# =#

##
@InstallMethod( /,
        "for a string and a morphism in a category of coequalizer pairs",
        [ IsString, IsMorphismInCoequalizerPreCompletion ],
        
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
        [ IsMorphismInCoequalizerPreCompletion, IsPosInt ],
        
  function ( mor, string_as_int )
    
    return NameRNam( string_as_int ) / mor;
    
end );
# =#

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
@InstallMethod( DisplayString,
        "for an object in the category of coequalizer pairs of a category",
        [ IsObjectInCoequalizerPreCompletion ],
        
  function ( parallel_pair )
    local CoequalizerPreCompletion;
    
    CoequalizerPreCompletion = CapCategory( parallel_pair );
    
    return @Concatenation( DisplayString( ModelingObject( CoequalizerPreCompletion, parallel_pair ) ), "\nAn object in ", Name( CoequalizerPreCompletion ), " given by the above data\n" );
    
end );

##
@InstallMethod( DisplayString,
        "for a morphism in the category of coequalizer pairs of a category",
        [ IsMorphismInCoequalizerPreCompletion ],
        
  function ( parallel_pair_morphism )
    local CoequalizerPreCompletion;
    
    CoequalizerPreCompletion = CapCategory( parallel_pair_morphism );
    
    return @Concatenation( DisplayString( ModelingMorphism( CoequalizerPreCompletion, parallel_pair_morphism ) ), "\nA morphism in ", Name( CoequalizerPreCompletion ), " given by the above data\n" );
    
end );
