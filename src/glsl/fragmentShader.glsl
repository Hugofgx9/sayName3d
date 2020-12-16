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
  vec3 color;
  float bwTexture = float ((finalTexture.r + finalTexture.y + finalTexture.z) / 3.);

  if (finalTexture.a  > 0.5) {
  	color = vec3(0.);
  }
  else { 
  	color = vec3(1.);
	}
  //vec3 color = vec3(1., 0, 1.0) * ((finalTexture.x + finalTexture.y + finalTexture.z ) / 3.);

  //gl_FragColor = texture;
  //gl_FragColor = vec4( vec3(color), 1.0);
  gl_FragColor = vec4( color, 1.0);
}