void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 xy = fragCoord.xy / iResolution.xy;
    vec4 texColor = texture(iChannel0, xy);
    float col = (texColor.r + texColor.g + texColor.b) / 3.0;
    fragColor = vec4(col, col, col, 1.0);
}