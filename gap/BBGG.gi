#
# BBGG: BBG correspondence and Beilinson monad
#
# Implementations
#
InstallMethod( AsPresentationInCAP,
                [ IsHomalgGradedModule ],
    function( M )
    local N, s;
    s := PositionOfTheDefaultPresentation( M );
    SetPositionOfTheDefaultPresentation( M, 1 );
    if IsHomalgRightObjectOrMorphismOfRightObjects( M ) then
        N := AsGradedRightPresentation( MatrixOfRelations( M ), DegreesOfGenerators( M ) );
        SetPositionOfTheDefaultPresentation( M, s );
        SetAsPresentationInHomalg( N, M );
        return N;
    else
        N := AsGradedLeftPresentation( MatrixOfRelations( M ), DegreesOfGenerators( M ) );
        SetPositionOfTheDefaultPresentation( M, s );
        SetAsPresentationInHomalg( N, M );
        return N;
    fi;
end );

InstallMethod( AsPresentationInHomalg,
                [ IsGradedLeftOrRightPresentation ],
    function( M )
    local N;
    if IsGradedRightPresentation( M ) then
        N := RightPresentationWithDegrees( UnderlyingMatrix( M ), GeneratorDegrees( M ) );
        SetAsPresentationInCAP( N, M );
        return N;
    else
        N := LeftPresentationWithDegrees( UnderlyingMatrix( M ), GeneratorDegrees( M ) );
        SetAsPresentationInCAP( N, M );
        return N;
    fi;
end );

InstallMethod( AsPresentationMorphismInCAP,
                [ IsHomalgGradedMap ],
    function( f )
    local g, M, N, s, t;
    s := PositionOfTheDefaultPresentation( Source( f ) );
    t := PositionOfTheDefaultPresentation( Range( f ) );
    
    SetPositionOfTheDefaultPresentation( Source( f ), 1 );
    SetPositionOfTheDefaultPresentation( Range( f ), 1 );
    
    M := AsPresentationInCAP( Source( f ) );
    N := AsPresentationInCAP( Range( f ) );
    
    g := GradedPresentationMorphism( M, MatrixOfMap( f ), N );

    SetPositionOfTheDefaultPresentation( Source( f ), s );
    SetPositionOfTheDefaultPresentation( Range( f ), t );
    SetAsPresentationInHomalg( g, f );
    
    return g;

end );

InstallMethod( AsPresentationMorphismInHomalg,
                [ IsGradedLeftOrRightPresentationMorphism ],
    function( f )
    local M, N, g;
    M := AsPresentationInHomalg( Source( f ) );
    N := AsPresentationInHomalg( Range( f ) );
    g :=  GradedMap( UnderlyingMatrix( f ), M, N );
    SetAsPresentationMorphismInCAP( g, f );
    return g;
end );
