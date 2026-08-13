# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

#= comment for Julia
##
@InstallMethod( QUO,
        [ IsMatrix, FilterIntersection( IsCapCategory, HasCommutativeSemiringOfLinearCategory ) ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeSemiringOfLinearCategory( A ) ) / A;
    
end );
# =#

##
## Required for Julia: set conjunction-derived lattice/Heyting properties that GAP infers via
## InstallTrueMethod conjunctions but Julia cannot; call on the modeling category before WrapperCategory.
@BindGlobal( "ADD_CONJUNCTION_DERIVED_LATTICE_PROPERTIES",
  function ( cat )
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianClosedCategory, IsBicartesianCategory and IsCartesianClosedCategory );
    if (HasIsBicartesianCategory( cat ) && IsBicartesianCategory( cat ) &&
      HasIsCartesianClosedCategory( cat ) && IsCartesianClosedCategory( cat ))
      SetIsBicartesianClosedCategory( cat, true );
    end;
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianCoclosedCategory, IsBicartesianCategory and IsCocartesianCoclosedCategory );
    if (HasIsBicartesianCategory( cat ) && IsBicartesianCategory( cat ) &&
      HasIsCocartesianCoclosedCategory( cat ) && IsCocartesianCoclosedCategory( cat ))
      SetIsBicartesianCoclosedCategory( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
    if (HasIsPosetCategory( cat ) && IsPosetCategory( cat ) &&
      HasIsCartesianCategory( cat ) && IsCartesianCategory( cat ))
      SetIsStrictCartesianCategory( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );
    if (HasIsPosetCategory( cat ) && IsPosetCategory( cat ) &&
      HasIsCocartesianCategory( cat ) && IsCocartesianCategory( cat ))
      SetIsStrictCocartesianCategory( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
    if (HasIsThinCategory( cat ) && IsThinCategory( cat ) &&
      HasIsCartesianCategory( cat ) && IsCartesianCategory( cat ))
      SetIsCartesianProset( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
    if (HasIsThinCategory( cat ) && IsThinCategory( cat ) &&
      HasIsCocartesianCategory( cat ) && IsCocartesianCategory( cat ))
      SetIsCocartesianProset( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
    if (HasIsCartesianProset( cat ) && IsCartesianProset( cat ) &&
      HasIsCocartesianProset( cat ) && IsCocartesianProset( cat ))
      SetIsBicartesianProset( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
    if (HasIsCartesianProset( cat ) && IsCartesianProset( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsMeetSemiLattice( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
    if (HasIsCocartesianProset( cat ) && IsCocartesianProset( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsJoinSemiLattice( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
    if (HasIsMeetSemiLattice( cat ) && IsMeetSemiLattice( cat ) &&
      HasIsJoinSemiLattice( cat ) && IsJoinSemiLattice( cat ))
      SetIsLattice( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
    if (HasIsBicartesianProset( cat ) && IsBicartesianProset( cat ) &&
      HasIsDistributiveCategory( cat ) && IsDistributiveCategory( cat ))
      SetIsDistributiveBicartesianProset( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
    if (HasIsDistributiveBicartesianProset( cat ) && IsDistributiveBicartesianProset( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsDistributiveLattice( cat, true );
    end;
    
    ## Lattice.gi: InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
    if (HasIsDistributiveBicartesianProset( cat ) && IsDistributiveBicartesianProset( cat ) &&
      HasIsEquivalentToFiniteCategory( cat ) && IsEquivalentToFiniteCategory( cat ))
      SetIsBiHeytingAlgebroid( cat, true );
    end;
    
    ## BooleanAlgebra.gi: InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsBiHeytingAlgebroid( cat ) && IsBiHeytingAlgebroid( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsBiHeytingAlgebra( cat, true );
    end;
    
    ## HeytingAlgebra.gi: InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsHeytingAlgebroid( cat ) && IsHeytingAlgebroid( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsHeytingAlgebra( cat, true );
    end;
    
    ## CoHeytingAlgebra.gi: InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
    if (HasIsCoHeytingAlgebroid( cat ) && IsCoHeytingAlgebroid( cat ) &&
      HasIsSkeletalCategory( cat ) && IsSkeletalCategory( cat ))
      SetIsCoHeytingAlgebra( cat, true );
    end;
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory and IsFiniteCocompleteCategory );
    if (HasIsFiniteCompleteCategory( cat ) && IsFiniteCompleteCategory( cat ) &&
      HasIsFiniteCocompleteCategory( cat ) && IsFiniteCocompleteCategory( cat ))
      SetIsFiniteBicompleteCategory( cat, true );
    end;
    
end );
