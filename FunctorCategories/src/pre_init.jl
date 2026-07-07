# To avoid name clashes, we exclude some names from the global namespace of the extension module.
empty!(ExcludedNames)

append!(ExcludedNames, [
  :HasPseudoInverse,
  :SetPseudoInverse,
  :PseudoInverse,
  :PseudoInverse_OPERATION,
  :TheJuliaAttributeTypePseudoInverse,
  :HasSize,
  :SetSize,
  :Size,
  :Size_OPERATION,
  :TheJuliaAttributeTypeSize,
  :Cardinality,
  :Cardinality_OPERATION,
  :Dimension,
  :Dimension_OPERATION,
  :HasCardinality,
  :HasDimension,
  :HasUnderlyingMorphism,
  :SetCardinality,
  :SetDimension,
  :SetUnderlyingMorphism,
  :TheJuliaAttributeTypeCardinality,
  :TheJuliaAttributeTypeDimension,
  :TheJuliaAttributeTypeUnderlyingMorphism,
  :UnderlyingMorphism,
  :UnderlyingMorphism_OPERATION,
  :AmbientCategory,
  :AmbientCategory_OPERATION,
  :HasAmbientCategory,
  :SetAmbientCategory,
  :TheJuliaAttributeTypeAmbientCategory,
  :Visualize,
])

@FilterIntersection( IsCapCategory, IsFinite )
