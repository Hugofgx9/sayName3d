<script>
import fragmentShader from '@/glsl/fragmentShader.glsl';
import vertexShader from '@/glsl/vertexShader.glsl';
import threeRender from '@/class/3d/threeRender';
const fontFile = require('@/assets/monument_fonts/MonumentExtended-Regular.fnt');
const fontAtlas = require('@/assets/monument_fonts/MonumentExtended-Regular.png');


export default {
	name: 'Hello3d',
	data() {
		return {
			name : 'Name',
			render: null,
		};
	},
	mounted () {
		this.writeYourName();
		//console.log(vertexShader);

		// eslint-disable-next-line no-unused-vars
		this.render = new threeRender({
			container: this.$refs.container,
			fontFile: fontFile,
			fontAtlas: fontAtlas,
			planeFragmentShader: fragmentShader,
			planeVertexShader: vertexShader,
			text: this.name,
		});

		// document.addEventListener('wheel', function(e) {
		// 	console.log(e.deltaY);
		// })

	},
	methods: {
		writeYourName() {
			window.addEventListener('keydown', (event) => { 
					//console.log(event.key)
					if ( event.key == 'Backspace') {
						this.name = this.name.slice(0, -1)
						this.render.setText(this.name);
					}
					else if (this.isStringALetter(event.key)) {
						this.name += event.key;
						this.render.setText(this.name);
					}
				}
			);
		},
		isStringALetter(char) {
			if (char.length == 1 && (/[a-zA-Z]/).test(char) ) {
				return true;
			}
		},
	},
}
</script>

<template>
	<div ref="container" id="container">
		<div class="text">
			<div>
				<span>Please tell me your name? </span>
			</div>
			<div>
				<span>{{ name }}</span>
				<span class="cursor">|</span>
			</div>
		</div>
	</div>
</template>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang='scss'>

#container {
	height: 100vh;
	position: relative;

	canvas {
		z-index: -2;
		position: absolute;
		top: 0;
		left: 0;
	}

	.text {
		padding-top: 40px;
	}

	.cursor {
		font-weight: 500;
		font-size: 1.5rem;
		position: relative;
		top: 0.2rem;
	}
}

</style>
