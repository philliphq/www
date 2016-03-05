RootsUtil       = require 'roots-util'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
dynamic_content = require 'dynamic-content'
browserify      = require 'roots-browserify'
image_pipeline  = require 'roots-image-pipeline'
statica         = require 'statica'
autoprefixer    = require 'autoprefixer'

module.exports =
  ignores: [
    'readme.md'
    '**/layout.*'
    '**/_*/*'
    '**/_*/**/*'
    '**/_*'
    '.gitignore'
    '**/drafts/**/*'
    'ship.*conf'
  ]

  browser:
    open: false

  # before: (roots) ->
  #   helpers = new RootsUtil.Helpers
  #   helpers.project.remove_folders(roots.config.output)

  extensions: [
    image_pipeline(
      files: 'assets/img/**'
      compress: true
      resize: true
      output_webp: true
    )
    js_pipeline(files: 'assets/js/**/*.{js,coffee}')
    css_pipeline(files: 'assets/css/main.sass', postcss: true)
    dynamic_content()
    statica()
    browserify(
      files: 'assets/js/main.coffee'
      out: 'js/main.js'
      minify: false
      sourceMap: true
    )
  ]

  scss:
    sourcemap: true
    minify: true
    indentedSyntax: true

  postcss:
    use: [autoprefixer(browsers: ['last 3 versions'])]

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
    basedir: '/Users/molovo/projects/philliphq/views'
    filters:
      marked:
        gfm: true
        tables: true
        breaks: true
        pedantic: false
        sanitize: true
        smartLists: true
        smartypants: true
