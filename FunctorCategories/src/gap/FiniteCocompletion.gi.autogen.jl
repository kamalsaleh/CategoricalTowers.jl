# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

# Do we still need this??
@FilterIntersection( IsWrapperCapCategory, IsFiniteCocompletion );
@FilterIntersection( IsWrapperCapCategoryObject, IsObjectInFiniteCocompletion );
@FilterIntersection( IsWrapperCapCategoryMorphism, IsMorphismInFiniteCocompletion );

##
InstallMethodWithCache( FiniteCocompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          PSh,
          finite_cocompletion;
    
    ##
    name = @Concatenation( "FiniteCocompletion( ", Name( fp_category ), " )" );
    
    ##
    category_filter = IsFiniteCocompletion;
    category_object_filter = IsObjectInFiniteCocompletion;
    category_morphism_filter = IsMorphismInFiniteCocompletion;
    
    ## building the categorical tower:
    
    PSh = PreSheaves( fp_category, range_category_of_hom_structure; FinalizeCategory = true, overhead = false );

    ## Required for Julia: set conjunction-derived properties before WrapperCategory;
    ## ReinterpretationOfCategory propagates ListKnownCategoricalProperties to the wrapper before Finalize.
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianClosedCategory, IsBicartesianCategory and IsCartesianClosedCategory );
    if (HasIsBicartesianCategory( PSh ) && IsBicartesianCategory( PSh ) &&
      HasIsCartesianClosedCategory( PSh ) && IsCartesianClosedCategory( PSh ))
      SetIsBicartesianClosedCategory( PSh, true );
    end;

    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianCoclosedCategory, IsBicartesianCategory and IsCocartesianCoclosedCategory );
    if (HasIsBicartesianCategory( PSh ) && IsBicartesianCategory( PSh ) &&
      HasIsCocartesianCoclosedCategory( PSh ) && IsCocartesianCoclosedCategory( PSh ))
      SetIsBicartesianCoclosedCategory( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
    if (HasIsPosetCategory( PSh ) && IsPosetCategory( PSh ) &&
      HasIsCartesianCategory( PSh ) && IsCartesianCategory( PSh ))
      SetIsStrictCartesianCategory( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );
    if (HasIsPosetCategory( PSh ) && IsPosetCategory( PSh ) &&
      HasIsCocartesianCategory( PSh ) && IsCocartesianCategory( PSh ))
      SetIsStrictCocartesianCategory( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
    if (HasIsThinCategory( PSh ) && IsThinCategory( PSh ) &&
      HasIsCartesianCategory( PSh ) && IsCartesianCategory( PSh ))
      SetIsCartesianProset( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
    if (HasIsThinCategory( PSh ) && IsThinCategory( PSh ) &&
      HasIsCocartesianCategory( PSh ) && IsCocartesianCategory( PSh ))
      SetIsCocartesianProset( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
    if (HasIsCartesianProset( PSh ) && IsCartesianProset( PSh ) &&
      HasIsCocartesianProset( PSh ) && IsCocartesianProset( PSh ))
      SetIsBicartesianProset( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
    if (HasIsCartesianProset( PSh ) && IsCartesianProset( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsMeetSemiLattice( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
    if (HasIsCocartesianProset( PSh ) && IsCocartesianProset( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsJoinSemiLattice( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
    if (HasIsMeetSemiLattice( PSh ) && IsMeetSemiLattice( PSh ) &&
      HasIsJoinSemiLattice( PSh ) && IsJoinSemiLattice( PSh ))
      SetIsLattice( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
    if (HasIsBicartesianProset( PSh ) && IsBicartesianProset( PSh ) &&
      HasIsDistributiveCategory( PSh ) && IsDistributiveCategory( PSh ))
      SetIsDistributiveBicartesianProset( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
    if (HasIsDistributiveBicartesianProset( PSh ) && IsDistributiveBicartesianProset( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsDistributiveLattice( PSh, true );
    end;

    ## Lattice.gi: InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
    if (HasIsDistributiveBicartesianProset( PSh ) && IsDistributiveBicartesianProset( PSh ) &&
      HasIsEquivalentToFiniteCategory( PSh ) && IsEquivalentToFiniteCategory( PSh ))
      SetIsBiHeytingAlgebroid( PSh, true );
    end;

    ## BooleanAlgebra.gi: InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsBiHeytingAlgebroid( PSh ) && IsBiHeytingAlgebroid( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsBiHeytingAlgebra( PSh, true );
    end;

    ## HeytingAlgebra.gi: InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsHeytingAlgebroid( PSh ) && IsHeytingAlgebroid( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsHeytingAlgebra( PSh, true );
    end;

    ## CoHeytingAlgebra.gi: InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsCoHeytingAlgebroid( PSh ) && IsCoHeytingAlgebroid( PSh ) &&
      HasIsSkeletalCategory( PSh ) && IsSkeletalCategory( PSh ))
      SetIsCoHeytingAlgebra( PSh, true );
    end;

    ## BicartesianCategories.gi: InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory and IsFiniteCocompleteCategory );
    if (HasIsFiniteCompleteCategory( PSh ) && IsFiniteCompleteCategory( PSh ) &&
      HasIsFiniteCocompleteCategory( PSh ) && IsFiniteCocompleteCategory( PSh ))
      SetIsFiniteBicompleteCategory( PSh, true );
    end;

    ##
    finite_cocompletion =
      WrapperCategory( PSh,
              @rec( name = name,
                   category_filter = category_filter,
                   category_object_filter = category_object_filter,
                   category_morphism_filter = category_morphism_filter,
                   only_primitive_operations = true )
              );
    
    SetUnderlyingCategory( finite_cocompletion, fp_category );
    
    return finite_cocompletion;
    
end );

##
@InstallMethod( FiniteCocompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( fp_category )
    
    if (@not HasRangeCategoryOfHomomorphismStructure( fp_category ))
        TryNextMethod( );
    end;
    
    return FiniteCocompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
@InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    local Y;
    
    Y = YonedaEmbeddingOfSourceCategory( ModelingCategory( finite_cocompletion ) );
    
    return PreCompose( Y, WrappingFunctor( finite_cocompletion ) );
    
end );

##
@InstallMethod( /,
        "for a string and a finite cocompletion category",
        [ IsString, IsFiniteCocompletion ],
        
  function( name, finite_cocompletion )
    local F, Y, Yc;
    
    F = UnderlyingCategory( finite_cocompletion );
    
    Y = EmbeddingOfUnderlyingCategory( finite_cocompletion );
    
    Yc = CallFuncListAtRuntime( ApplyFunctor, [ Y, F[name] ] );
    
    if (IsObjectInFiniteCocompletion( Yc ))
        
        SetIsProjective( Yc, true );
        
    elseif (IsMorphismInFiniteCocompletion( Yc ))
        
        #if CanCompute( finite_cocompletion, "IsMonomorphism" ))
        #    IsMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsSplitMonomorphism" ))
        #    IsSplitMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsEpimorphism" ))
        #    IsEpimorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsSplitEpimorphism" ))
        #    IsSplitEpimorphism( Yc );
        #fi;
        
        ## IsIsomorphism == IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if (CanCompute( finite_cocompletion, "IsIsomorphism" ))
            IsIsomorphism( Yc );
        end;
        
    end;
    
    return Yc;
    
end );

#= comment for Julia
##
INSTALL_DOT_METHOD( IsFiniteCocompletion );
# =#

##
@InstallMethod( /,
        "for a string and a cell in a finite cocompletion category",
        [ IsString, IsCellInFiniteCocompletion ],
        
  function( name, cell )
    
    return UnderlyingCell( cell )[name];
    
end );

#= comment for Julia
INSTALL_DOT_METHOD( IsCellInFiniteCocompletion );
# =#

##
@InstallMethod( SetOfObjects,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    
    return SetOfObjectsOfCategory( finite_cocompletion );
    
end );

##
@InstallMethod( SetOfGeneratingMorphisms,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    
    return SetOfGeneratingMorphismsOfCategory( finite_cocompletion );
    
end );
