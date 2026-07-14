# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
@InstallValueConst( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "Colift",
   "InverseForMorphisms",
   "IsAutomorphism",
   "IsColiftable",
   "IsIsomorphism",
   "IsLiftable",
   "IsSplitEpimorphism",
   "IsSplitMonomorphism",
   "IsZeroForMorphisms",
   "Lift",
   "MultiplyWithElementOfCommutativeSemiringForMorphisms",
   "SubtractionForMorphisms",
   "ZeroMorphism"
   ] );

##
@InstallValueConst( CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY,
  [
   "ComponentOfMorphismFromDirectSum",
   "ComponentOfMorphismIntoDirectSum",
   "DirectSum",
   "DirectSumCodiagonalDifference",
   "DirectSumDiagonalDifference",
   "DirectSumFunctorialWithGivenDirectSums",
   "DirectSumProjectionInPushout",
   "InjectionOfCofactorOfDirectSum",
   "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   "IsomorphismFromCoproductToDirectSum",
   "IsomorphismFromDirectProductToDirectSum",
   "IsomorphismFromDirectSumToCoproduct",
   "IsomorphismFromDirectSumToDirectProduct",
   "IsZeroForObjects",
   "MorphismBetweenDirectSumsWithGivenDirectSums",
   "ProjectionInFactorOfDirectSum",
   "ProjectionInFactorOfDirectSumWithGivenDirectSum",
   "UniversalMorphismFromDirectSum",
   "UniversalMorphismFromDirectSumWithGivenDirectSum",
   "UniversalMorphismIntoDirectSum",
   "UniversalMorphismIntoDirectSumWithGivenDirectSum",
   "UniversalMorphismFromZeroObject",
   "UniversalMorphismFromZeroObjectWithGivenZeroObject",
   "UniversalMorphismIntoZeroObject",
   "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
   "ZeroObject",
   "ZeroObjectFunctorial",
   ] );

##
@InstallMethod( FullSubcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
  
  @FunctionWithNamedArguments(
  [
    [ "category_filter", fail ],
    [ "category_object_filter", fail ],
    [ "category_morphism_filter", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, C, name )
    local D;
    
    D = Subcategory( C, name; is_full = true,
            category_filter = category_filter,
            category_object_filter = category_object_filter,
            category_morphism_filter = category_morphism_filter,
            FinalizeCategory = false );
    
    if (CanCompute( C, "MultiplyWithElementOfCommutativeSemiringForMorphisms" ))
        
        ##
        AddMultiplyWithElementOfCommutativeSemiringForMorphisms( D,
          function( cat, r, phi )
            
            return AsSubcategoryCell( cat, MultiplyWithElementOfCommutativeSemiringForMorphisms( AmbientCategory( cat ), r, UnderlyingCell( phi ) ) );
            
        end );
        
    end;
    
    if (HasRangeCategoryOfHomomorphismStructure( C ))
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( D, RangeCategoryOfHomomorphismStructure( C ) );
        
        if (CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ))
            AddDistinguishedObjectOfHomomorphismStructure( D,
              function( cat )
                
                return DistinguishedObjectOfHomomorphismStructure( AmbientCategory( cat ) );
                
            end );
        end;
        
        if (CanCompute( C, "HomomorphismStructureOnObjects" ))
            AddHomomorphismStructureOnObjects( D,
              function( cat, a, b )
                
                return HomomorphismStructureOnObjects( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ) );
                
            end );
        end;
        
        if (CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ))
            AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
              function( cat, s, alpha, beta, r )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( AmbientCategory( cat ), s, UnderlyingCell( alpha ), UnderlyingCell( beta ), r );
                
            end );
        end;
        
        if (CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ))
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
              function( cat, alpha )
                
                return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( AmbientCategory( cat ), UnderlyingCell( alpha ) );
                
            end );
        end;
        
        if (CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ))
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
              function( cat, a, b, iota )
                
                return AsSubcategoryCell( cat, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ), iota ) );
                
            end );
        end;
        
        if (CanCompute( C, "BasisOfExternalHom" ) && CanCompute( C, "CoefficientsOfMorphism" ))
            
            AddBasisOfExternalHom( D,
              function( cat, a, b )
                
                return List( BasisOfExternalHom( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ) ), m -> AsSubcategoryCell( cat, m ) );
                
            end );
            
            AddCoefficientsOfMorphism( D,
              function( cat, alpha )
                
                return CoefficientsOfMorphism( AmbientCategory( cat ), UnderlyingCell( alpha ) );
                
            end );
            
        end;
        
    end;
    
    if (FinalizeCategory)
      
      Finalize( D );
      
    end;
    
    return D;
    
end ) );

##
@InstallGlobalFunction( FullSubcategoryGeneratedByListOfObjects,
  @FunctionWithNamedArguments(
  [
    [ "name_of_full_subcategory", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, L )
    local C, name, full;
    
    if (L == [ ])
        Error( "the input list is empty\n" );
    end;
    
    C = CapCategory( L[1] );
    
    L = Immutable( ShallowCopy( L ) );
    
    name = name_of_full_subcategory;
    
    if (name == fail)
      
      if (Length( L ) > 1)
        name = @Concatenation( "Full subcategory generated by ", StringGAP( Length( L ) ), " objects in ", Name( C ) );
      else
        name = @Concatenation( "Full subcategory generated by 1 object in ", Name( C ) );
      end;
      
    end;
    
    full = FullSubcategory( C, name; category_filter = IsCapFullSubcategoryGeneratedByFiniteNumberOfObjects, FinalizeCategory = false );
    
    full.Objects = L;
    
    AddSetOfObjectsOfCategory( full,
      function( cat )
        
        return List( L, obj -> AsSubcategoryCell( cat, obj ) );
        
    end );
    
    AddIsWellDefinedForObjects( full,
      function( cat, a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end );
    
    if (CanCompute( C, "IsWellDefinedForMorphisms" ))
      
      AddIsWellDefinedForMorphisms( full,
        function( cat, phi )
          
          return IsWellDefinedForObjects( cat, Source( phi ) ) &&
                 IsWellDefinedForObjects( cat, Target( phi ) ) &&
                 IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( phi ) );
                    
      end );
      
    end;
    
    if (FinalizeCategory)
      
      Finalize( full );
      
    end;
    
    return full;
    
end ) );

##
@InstallMethod( SetOfKnownObjects,
          [ IsCapFullSubcategoryGeneratedByFiniteNumberOfObjects ],
  SetOfObjects );

##
@InstallMethod( getindex,
          [ IsCapFullSubcategoryGeneratedByFiniteNumberOfObjects, IsInt ],
  ( full, i ) -> SetOfObjects( full )[ i ] );

##
@InstallMethod( FullSubcategoryOfIndecomposableProjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    if (@not CanCompute( C, "IndecomposableProjectiveObjects" ))
      Error( "the operation 'IndecomposableProjectiveObjects' must be computable in the input category!\n" );
    end;
    
    name = @Concatenation( "FullSubcategoryOfIndecomposableProjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryGeneratedByListOfObjects( IndecomposableProjectiveObjects( C ); name_of_full_subcategory = name );
    
end );

##
@InstallMethod( FullSubcategoryOfIndecomposableInjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    if (@not CanCompute( C, "IndecomposableInjectiveObjects" ))
      Error( "the operation 'IndecomposableInjectiveObjects' must be computable in the input category!\n" );
    end;
    
    name = @Concatenation( "FullSubcategoryOfIndecomposableInjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryGeneratedByListOfObjects( IndecomposableInjectiveObjects( C ); name_of_full_subcategory = name );
    
end );


##
@InstallGlobalFunction( FullSubcategoryByObjectMembershipFunction,
  @FunctionWithNamedArguments(
  [
    [ "name_of_full_subcategory", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, C, membership_func )
    local name, full_subcat;
    
    name = name_of_full_subcategory;
    
    if (name == fail)
        
        name = @Concatenation( "FullSubcategoryByObjectMembershipFunction( ", Name( C ), ", ObjectMembershipFunction )" );
        
    end;
    
    full_subcat = FullSubcategory( C, name; category_filter = IsCapFullSubcategoryDefinedByObjectMembershipFunction, FinalizeCategory = false );
    
    full_subcat.ObjectMembershipFunction = membership_func;
    
    ##
    AddIsWellDefinedForObjects( full_subcat,
      function( full_subcat, object_in_full_subcat )
        local ambient_cat, object_in_ambient_cat;
        
        ambient_cat = AmbientCategory( full_subcat );
        
        object_in_ambient_cat = UnderlyingCell( object_in_full_subcat );
        
        return IsWellDefinedForObjects( ambient_cat, object_in_ambient_cat ) &&
               full_subcat.ObjectMembershipFunction( ambient_cat, object_in_ambient_cat );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( full_subcat,
      function( full_subcat, alpha )
        
        return IsWellDefinedForMorphisms( AmbientCategory( full_subcat ), UnderlyingCell( alpha ) ) &&
               IsWellDefinedForObjects( full_subcat, Source( alpha ) ) &&
               IsWellDefinedForObjects( full_subcat, Target( alpha ) );
        
    end );
    
    if (FinalizeCategory)
      
      Finalize( full_subcat );
      
    end;
    
    return full_subcat;
    
end ) );

##
@InstallMethod( FullSubcategoryOfProjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    name = @Concatenation( "FullSubcategoryOfProjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryByObjectMembershipFunction( C,
                   ( C, object ) -> IsProjective( C, object )
                  ; name_of_full_subcategory = name );
    
end );

##
@InstallMethod( FullSubcategoryOfInjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    name = @Concatenation( "FullSubcategoryOfInjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryByObjectMembershipFunction( C,
                   ( C, object ) -> IsInjective( C, object )
                  ; name_of_full_subcategory = name );
    
end );

##################################
##
## View & Display
##
##################################

##
@InstallMethod( ViewString,
    [ IsObjectInAFullSubcategory ],
  function( a )
    
    return @Concatenation( "An object in full subcategory given by: ", ViewString( UnderlyingCell( a ) ) );
    
end );

##
@InstallMethod( ViewString,
    [ IsMorphismInAFullSubcategory ],
  function( phi )
    
    return @Concatenation( "A morphism in full subcategory given by: ", ViewString( UnderlyingCell( phi ) ) );
    
end );

##
@InstallMethod( DisplayString,
    [ IsObjectInAFullSubcategory ],
  function( a )
    
    return @Concatenation( DisplayString( UnderlyingCell( a ) ), "\nAn object in full subcategory given by the above data\n" );
    
end );

##
@InstallMethod( DisplayString,
    [ IsMorphismInAFullSubcategory ],
  function( phi )
    
    return @Concatenation( DisplayString( UnderlyingCell( phi ) ), "\nA morphism in full subcategory given by the above data\n" );
    
end );
