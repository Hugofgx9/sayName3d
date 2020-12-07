module.exports = {
	css: {
		loaderOptions: {
			sass: {
				additionalData: 
				`@import "@/scss/_variables.scss";`
			}
		}
	},
	configureWebpack: {
		module: { 
			rules: [
				{ 
					test: /\.(woff|woff2|eot|ttf|svg|fnt)(\?.*$|$)/, 
					loader: 'file-loader' 
				},
				{
					test: /\.(glsl|vs|fs|vert|frag)$/,
					exclude: /node_modules/,
					use: [
						'raw-loader',
						'glslify-loader'
					]
				}
			]
		}
	},
};