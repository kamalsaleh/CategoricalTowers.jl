# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( FreeDistributiveCompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          finite_completion, finite_cocompletion,
          free_distributive_completion;
    
    ##
    name = @Concatenation( "FreeDistributiveCompletion( ", Name( fp_category ), " )" );
    
    ##
    category_filter = IsFreeDistributiveCompletion;
    category_object_filter = IsObjectInFreeDistributiveCompletion;
    category_morphism_filter = IsMorphismInFreeDistributiveCompletion;
    
    ## building the categorical tower:
    
    finite_completion = FiniteCompletion( fp_category, range_category_of_hom_structure
                            #= comment for julia (Temporarily)
                           ; overhead = false
                            # =#
                            );
    
    finite_cocompletion = FiniteCocompletion( finite_completion, range_category_of_hom_structure
                            #= comment for julia (Temporarily)
                           ; overhead = false
                            # =#
                            );
    
    ## Required for Julia: set conjunction-derived properties on finite_cocompletion before WrapperCategory,
    ## since ReinterpretationOfCategory propagates ListKnownCategoricalProperties to the wrapper before Finalize.
    ## FiniteStrictCoproductCompletion.gi sets IsDistributiveCategory when its source is Cartesian; Julia does not propagate it through the wrapper tower.
    if (HasIsCartesianCategory( finite_completion ) && IsCartesianCategory( finite_completion ))
      SetIsDistributiveCategory( finite_cocompletion, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
    if (HasIsThinCategory( finite_cocompletion ) && IsThinCategory( finite_cocompletion ) &&
      HasIsCartesianCategory( finite_cocompletion ) && IsCartesianCategory( finite_cocompletion ))
      SetIsCartesianProset( finite_cocompletion, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
    if (HasIsThinCategory( finite_cocompletion ) && IsThinCategory( finite_cocompletion ) &&
      HasIsCocartesianCategory( finite_cocompletion ) && IsCocartesianCategory( finite_cocompletion ))
      SetIsCocartesianProset( finite_cocompletion, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
    if (HasIsCartesianProset( finite_cocompletion ) && IsCartesianProset( finite_cocompletion ) &&
      HasIsCocartesianProset( finite_cocompletion ) && IsCocartesianProset( finite_cocompletion ))
      SetIsBicartesianProset( finite_cocompletion, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
    if (HasIsBicartesianProset( finite_cocompletion ) && IsBicartesianProset( finite_cocompletion ) &&
      HasIsDistributiveCategory( finite_cocompletion ) && IsDistributiveCategory( finite_cocompletion ))
      SetIsDistributiveBicartesianProset( finite_cocompletion, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
    if (HasIsDistributiveBicartesianProset( finite_cocompletion ) && IsDistributiveBicartesianProset( finite_cocompletion ) &&
      HasIsEquivalentToFiniteCategory( finite_cocompletion ) && IsEquivalentToFiniteCategory( finite_cocompletion ))
      SetIsBiHeytingAlgebroid( finite_cocompletion, true );
    end;

    ## BooleanAlgebra.gi: InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsBiHeytingAlgebroid( finite_cocompletion ) && IsBiHeytingAlgebroid( finite_cocompletion ) &&
      HasIsSkeletalCategory( finite_cocompletion ) && IsSkeletalCategory( finite_cocompletion ))
      SetIsBiHeytingAlgebra( finite_cocompletion, true );
    end;

    ## HeytingAlgebra.gi: InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsHeytingAlgebroid( finite_cocompletion ) && IsHeytingAlgebroid( finite_cocompletion ) &&
      HasIsSkeletalCategory( finite_cocompletion ) && IsSkeletalCategory( finite_cocompletion ))
      SetIsHeytingAlgebra( finite_cocompletion, true );
    end;

    ## CoHeytingAlgebra.gi: InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsCoHeytingAlgebroid( finite_cocompletion ) && IsCoHeytingAlgebroid( finite_cocompletion ) &&
      HasIsSkeletalCategory( finite_cocompletion ) && IsSkeletalCategory( finite_cocompletion ))
      SetIsCoHeytingAlgebra( finite_cocompletion, true );
    end;

    ## BicartesianCategories.gi: InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory and IsFiniteCocompleteCategory );
    if (HasIsFiniteCompleteCategory( finite_cocompletion ) && IsFiniteCompleteCategory( finite_cocompletion ) &&
      HasIsFiniteCocompleteCategory( finite_cocompletion ) && IsFiniteCocompleteCategory( finite_cocompletion ))
      SetIsFiniteBicompleteCategory( finite_cocompletion, true );
    end;

    ##
    free_distributive_completion =
       WrapperCategory( finite_cocompletion,
              @rec( name = name,
                   category_filter = category_filter,
                   category_object_filter = category_object_filter,
                   category_morphism_filter = category_morphism_filter,
              only_primitive_operations = true )
              );

    SetUnderlyingCategory( free_distributive_completion, fp_category );

    if (HasIsInitialCategory( fp_category ) && IsInitialCategory( fp_category ))
        @Assert( 0, [ ] == MissingOperationsForConstructivenessOfCategory( free_distributive_completion, "IsEquippedWithHomomorphismStructure" ) );
    end;
    
    return free_distributive_completion;
    
end );

##
@InstallMethod( FreeDistributiveCompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( fp_category )
    
    @Assert( 0, HasRangeCategoryOfHomomorphismStructure( fp_category ) );
    
    return FreeDistributiveCompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
@InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    local D, Y;
    
    D = ModelingCategory( free_distributive_completion );
    
    Y = PreCompose(
                 EmbeddingOfUnderlyingCategory( UnderlyingCategory( D ) ),
                 EmbeddingOfUnderlyingCategory( D ) );
    
    return PreCompose( Y, WrappingFunctor( free_distributive_completion ) );
    
end );

##
@InstallMethod( /,
        "for a string and a free distributive completion category",
        [ IsString, IsFreeDistributiveCompletion ],
        
  function( name, free_distributive_completion )
    local F, Y, Yc;
    
    F = UnderlyingCategory( free_distributive_completion );
    
    Y = EmbeddingOfUnderlyingCategory( free_distributive_completion );
    
    Yc = CallFuncListAtRuntime( ApplyFunctor, [ Y,  name / F  ] );
    
    if (IsObjectInFreeDistributiveCompletion( Yc ))
        
        SetIsProjective( Yc, true );
        
    elseif (IsMorphismInFreeDistributiveCompletion( Yc ))
        
        #if CanCompute( free_distributive_completion, "IsMonomorphism" ))
        #    IsMonomorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsSplitMonomorphism" ))
        #    IsSplitMonomorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsEpimorphism" ))
        #    IsEpimorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsSplitEpimorphism" ))
        #    IsSplitEpimorphism( Yc );
        #fi;
        
        ## IsIsomorphism == IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        #if CanCompute( free_distributive_completion, "IsIsomorphism" ))
        #    IsIsomorphism( Yc );
        #fi;
        
    end;
    
    return Yc;
    
end );

##
@InstallMethod( /,
        "for a string and an object in a free distributive completion category",
        [ IsString, IsObjectInFreeDistributiveCompletion ],
        
  function( name, object )
    
    return UnderlyingCell( object )[name];
    
end );

##
@InstallMethod( /,
        "for a string and a morphism in a free distributive completion category",
        [ IsString, IsMorphismInFreeDistributiveCompletion ],
        
  function( name, morphism )
    
    return UnderlyingCell( morphism )[name];
    
end );

#=
INSTALL_DOT_METHOD( IsFreeDistributiveCompletion );
INSTALL_DOT_METHOD( IsObjectInFreeDistributiveCompletion );
INSTALL_DOT_METHOD( IsMorphismInFreeDistributiveCompletion );
# =#

##
@InstallMethod( SetOfObjects,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    
    return SetOfObjectsOfCategory( free_distributive_completion );
    
end );

##
@InstallMethod( SetOfGeneratingMorphisms,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    
    return SetOfGeneratingMorphismsOfCategory( free_distributive_completion );
    
end );
