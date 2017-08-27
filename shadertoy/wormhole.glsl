void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	// normalized coordinates (-1 to 1 vertically)
    vec2 p = (-iResolution.xy + 2.0*fragCoord)/iResolution.y;

    // angle of each pixel to the center of the screen
    float a = atan(p.y,p.x);

    // cylindrical tunnel
    float r = length(p);
    
    // index texture by (animated inverse) radius and angle
    vec2 uv = vec2( 0.3/r + 0.2*iTime, a/3.14 );

    vec2 uv2 = vec2( uv.x, atan(p.y,abs(p.x))/3.14 );
    
    // Get texture in iChannel0
    vec3 col = textureGrad( iChannel0, uv, dFdx(uv2), dFdy(uv2) ).xyz;
    
    // darken at the center    
    col = col*r;
    
    fragColor = vec4( col, 1.0 );
}