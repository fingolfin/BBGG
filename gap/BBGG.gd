#
# BBGG: BBG correspondence and Beilinson monad
#
# Declarations
#

#DeclareAttribute( "CastelnuovoMumfordRegularity", IsCapCategoryObject );

DeclareAttribute( "TateResolution",  IsCapCategoryObject  );
DeclareAttribute( "TateResolution",  IsCapCategoryMorphism );

DeclareOperation( "DimensionOfTateCohomology", [ IsCochainComplex, IsInt, IsInt ] );

KeyDependentOperation( "TwistFunctor", IsHomalgGradedRing, IsInt, ReturnTrue );
DeclareOperation( "\[\]", [ IsGradedLeftOrRightPresentation, IsInt ] );

KeyDependentOperation( "TwistedStructureBundle", IsHomalgGradedRing, IsInt, ReturnTrue );
KeyDependentOperation( "TwistedCotangentBundle", IsHomalgGradedRing, IsInt, ReturnTrue );
KeyDependentOperation( "KoszulSyzygyModule", IsHomalgGradedRing, IsInt, ReturnTrue );
DeclareAttribute( "RFunctor", IsHomalgGradedRing );

DeclareAttribute( "RCochainFunctor", IsHomalgGradedRing );
DeclareAttribute( "RChainFunctor", IsHomalgGradedRing );

DeclareAttribute( "LFunctor", IsHomalgGradedRing );
DeclareAttribute( "TateFunctor", IsHomalgGradedRing );
DeclareAttribute( "TateFunctorForCochains", IsHomalgGradedRing );
DeclareAttribute( "TateSequenceFunctor", IsHomalgGradedRing );
