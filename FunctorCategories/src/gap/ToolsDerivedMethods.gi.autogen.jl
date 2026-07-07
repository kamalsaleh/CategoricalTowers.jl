# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
AddDerivationToCAP( ExactCoverWithGlobalElements,
                    "",
        [ [ BasisOfExternalHom, 1 ],
          [ TensorUnit, 1 ] ],
        
  function ( cat, A )
    
    return BasisOfExternalHom( cat, TensorUnit( cat ), A );
    
end,
  CategoryFilter = cat ->
                    HasRangeCategoryOfHomomorphismStructure( cat ) &&
                    IsIdenticalObj( cat, RangeCategoryOfHomomorphismStructure( cat ) ) &&
                    IsMatrixCategory( cat ) ||
                    ( IsCategoryOfRows( cat ) &&
                      HasCommutativeSemiringOfLinearCategory( cat ) &&
                      ## a commutative ring has the invariant basis property iff it is not the zero ring:
                      HasHasInvariantBasisProperty( CommutativeSemiringOfLinearCategory( cat ) ) &&
                      HasInvariantBasisProperty( CommutativeSemiringOfLinearCategory( cat ) ) ) );
