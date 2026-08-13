# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

# Do we still need this??
@FilterIntersection( IsWrapperCapCategory, IsFiniteCompletion );
@FilterIntersection( IsWrapperCapCategoryObject, IsObjectInFiniteCompletion );
@FilterIntersection( IsWrapperCapCategoryMorphism, IsMorphismInFiniteCompletion );

##
InstallMethodWithCache( FiniteCompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          coPSh,
          finite_completion;
    
    ##
    name = @Concatenation( "FiniteCompletion( ", Name( fp_category ), " )" );
    
    ##
    category_filter = IsFiniteCompletion;
    category_object_filter = IsObjectInFiniteCompletion;
    category_morphism_filter = IsMorphismInFiniteCompletion;
    
    ## building the categorical tower:
    
    coPSh = CoPreSheaves( fp_category, range_category_of_hom_structure; FinalizeCategory = true, overhead = false );

    ## Required for Julia: set conjunction-derived properties before WrapperCategory;
    ## ReinterpretationOfCategory propagates ListKnownCategoricalProperties to the wrapper before Finalize.
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianClosedCategory, IsBicartesianCategory and IsCartesianClosedCategory );
    if (HasIsBicartesianCategory( coPSh ) && IsBicartesianCategory( coPSh ) &&
      HasIsCartesianClosedCategory( coPSh ) && IsCartesianClosedCategory( coPSh ))
      SetIsBicartesianClosedCategory( coPSh, true );
    end;

    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianCoclosedCategory, IsBicartesianCategory and IsCocartesianCoclosedCategory );
    if (HasIsBicartesianCategory( coPSh ) && IsBicartesianCategory( coPSh ) &&
      HasIsCocartesianCoclosedCategory( coPSh ) && IsCocartesianCoclosedCategory( coPSh ))
      SetIsBicartesianCoclosedCategory( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
    if (HasIsPosetCategory( coPSh ) && IsPosetCategory( coPSh ) &&
      HasIsCartesianCategory( coPSh ) && IsCartesianCategory( coPSh ))
      SetIsStrictCartesianCategory( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );
    if (HasIsPosetCategory( coPSh ) && IsPosetCategory( coPSh ) &&
      HasIsCocartesianCategory( coPSh ) && IsCocartesianCategory( coPSh ))
      SetIsStrictCocartesianCategory( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
    if (HasIsThinCategory( coPSh ) && IsThinCategory( coPSh ) &&
      HasIsCartesianCategory( coPSh ) && IsCartesianCategory( coPSh ))
      SetIsCartesianProset( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
    if (HasIsThinCategory( coPSh ) && IsThinCategory( coPSh ) &&
      HasIsCocartesianCategory( coPSh ) && IsCocartesianCategory( coPSh ))
      SetIsCocartesianProset( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
    if (HasIsCartesianProset( coPSh ) && IsCartesianProset( coPSh ) &&
      HasIsCocartesianProset( coPSh ) && IsCocartesianProset( coPSh ))
      SetIsBicartesianProset( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
    if (HasIsCartesianProset( coPSh ) && IsCartesianProset( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsMeetSemiLattice( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
    if (HasIsCocartesianProset( coPSh ) && IsCocartesianProset( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsJoinSemiLattice( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
    if (HasIsMeetSemiLattice( coPSh ) && IsMeetSemiLattice( coPSh ) &&
      HasIsJoinSemiLattice( coPSh ) && IsJoinSemiLattice( coPSh ))
      SetIsLattice( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
    if (HasIsBicartesianProset( coPSh ) && IsBicartesianProset( coPSh ) &&
      HasIsDistributiveCategory( coPSh ) && IsDistributiveCategory( coPSh ))
      SetIsDistributiveBicartesianProset( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
    if (HasIsDistributiveBicartesianProset( coPSh ) && IsDistributiveBicartesianProset( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsDistributiveLattice( coPSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
    if (HasIsDistributiveBicartesianProset( coPSh ) && IsDistributiveBicartesianProset( coPSh ) &&
      HasIsEquivalentToFiniteCategory( coPSh ) && IsEquivalentToFiniteCategory( coPSh ))
      SetIsBiHeytingAlgebroid( coPSh, true );
    end;

    ## BooleanAlgebra.gi: InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsBiHeytingAlgebroid( coPSh ) && IsBiHeytingAlgebroid( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsBiHeytingAlgebra( coPSh, true );
    end;

    ## HeytingAlgebra.gi: InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsHeytingAlgebroid( coPSh ) && IsHeytingAlgebroid( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsHeytingAlgebra( coPSh, true );
    end;

    ## CoHeytingAlgebra.gi: InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsCoHeytingAlgebroid( coPSh ) && IsCoHeytingAlgebroid( coPSh ) &&
      HasIsSkeletalCategory( coPSh ) && IsSkeletalCategory( coPSh ))
      SetIsCoHeytingAlgebra( coPSh, true );
    end;

    ## BicartesianCategories.gi: InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory and IsFiniteCocompleteCategory );
    if (HasIsFiniteCompleteCategory( coPSh ) && IsFiniteCompleteCategory( coPSh ) &&
      HasIsFiniteCocompleteCategory( coPSh ) && IsFiniteCocompleteCategory( coPSh ))
      SetIsFiniteBicompleteCategory( coPSh, true );
    end;

    ##
    finite_completion =
      WrapperCategory( coPSh,
              @rec( name = name,
                   category_filter = category_filter,
                   category_object_filter = category_object_filter,
                   category_morphism_filter = category_morphism_filter,
                   only_primitive_operations = true )
              );
    
    SetUnderlyingCategory( finite_completion, fp_category );
    
    if (HasIsInitialCategory( fp_category ) && IsInitialCategory( fp_category ))
        @Assert( 0, [ ] == MissingOperationsForConstructivenessOfCategory( finite_completion, "IsEquippedWithHomomorphismStructure" ) );
    end;
    
    return finite_completion;
    
end );

##
@InstallMethod( FiniteCompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( fp_category )
    
    if (@not HasRangeCategoryOfHomomorphismStructure( fp_category ))
        TryNextMethod( );
    end;
    
    return FiniteCompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
@InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite completion category",
        [ IsFiniteCompletion ],
        
  function( finite_completion )
    local Y;
    
    Y = CoYonedaEmbedding( UnderlyingCategory( finite_completion ) );
    
    return PreCompose( Y, WrappingFunctor( finite_completion ) );
    
end );

##
@InstallMethod( /,
        "for a string and a finite completion category",
        [ IsString, IsFiniteCompletion ],
        
  function( name, finite_completion )
    local F, Y, Yc;
    
    F = UnderlyingCategory( finite_completion );
    
    Y = EmbeddingOfUnderlyingCategory( finite_completion );
    
    Yc = CallFuncListAtRuntime( ApplyFunctor, [ Y, F[name] ] );
    
    if (IsObjectInFiniteCompletion( Yc ))
        
        SetIsInjective( Yc, true );
        
    elseif (IsMorphismInFiniteCompletion( Yc ))
        
        #if CanCompute( finite_completion, "IsMonomorphism" ))
        #    IsMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_completion, "IsSplitMonomorphism" ))
        #    IsSplitMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_completion, "IsEpimorphism" ))
        #    IsEpimorphism( Yc );
        #fi;
        
        #if CanCompute( finite_completion, "IsSplitEpimorphism" ))
        #    IsSplitEpimorphism( Yc );
        #fi;
        
        ## IsIsomorphism == IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        #if CanCompute( finite_completion, "IsIsomorphism" ))
        #    IsIsomorphism( Yc );
        #fi;
        
    end;
    
    return Yc;
    
end );

#= comment for Julia
INSTALL_DOT_METHOD( IsFiniteCompletion );
# =#

#= comment for Julia
##
@InstallMethod( \.,
        "for a cell in a finite completion category and a positive integer",
        [ IsCellInFiniteCompletion, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell )[NameRNam( string_as_int ]);
    
end );
# =#

##
@InstallMethod( SetOfObjects,
        "for a finite completion category",
        [ IsFiniteCompletion ],
        
  function( finite_completion )
    
    return SetOfObjectsOfCategory( finite_completion );
    
end );

##
@InstallMethod( SetOfGeneratingMorphisms,
        "for a finite completion category",
        [ IsFiniteCompletion ],
        
  function( finite_completion )
    
    return SetOfGeneratingMorphismsOfCategory( finite_completion );
    
end );
