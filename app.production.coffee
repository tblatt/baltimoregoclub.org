#axis         = require 'axis'
#rupture      = require 'rupture'
#autoprefixer = require 'autoprefixer-stylus'
#js_pipeline  = require 'js-pipeline'
#css_pipeline = require 'css-pipeline'

#module.exports =
#  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

#  extensions: [
#    js_pipeline(files: 'assets/js/*.coffee', out: 'js/build.js', minify: true, hash: true),
#    css_pipeline(files: 'assets/css/*.styl', out: 'css/build.css', minify: true, hash: true)
#  ]

#  stylus:
#    use: [axis(), rupture(), autoprefixer()]

js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
sass         = require 'node-sass'
autoprefixer = require 'autoprefixer'
lost         = require 'lost'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee', out: 'js/build.js', minify: true)
    css_pipeline(files: 'assets/css/*.s[ac]ss', out: 'css/build.css', minify: true)
  ]

  postcss:
    use: [lost()]
    map: true
    processors: [autoprefixer]

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
