//fragmentShader

varying vec2 v_uv;

uniform sampler2D u_texture;
uniform vec2 u_res;

void main() {

	// We manage the device ratio by passing PR constant
	vec2 res = u_res * PR;
	vec2 st = gl_FragCoord.xy / res.xy - vec2(0.5);
	vec2 newUV = v_uv;

  // import & adjust textures
  vec4 finalTexture = texture2D(u_texture, newUV);

  //gl_FragColor = texture;
  gl_FragColor = vec4( finalTexture.xyz, finalTexture.a);
}