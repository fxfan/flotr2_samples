gulp = require 'gulp'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'

gulp.task 'scripts', ->
  browserify
    entries: ['src/js/index.js']
    debug: true
  .bundle()
  .pipe source 'index.js'
  .pipe buffer()
  .pipe sourcemaps.init { loadMaps: true }
#  .pipe uglify()
  .pipe sourcemaps.write './'
  .pipe gulp.dest 'public/js'

  browserify
    entries: ['src/js/breaking_down_pie_chart.coffee']
    debug: true
  .transform 'coffeeify'
  .bundle()
  .pipe source 'breaking_down_pie_chart.js'
  .pipe buffer()
  .pipe sourcemaps.init { loadMaps: true }
#  .pipe uglify()
  .pipe sourcemaps.write './'
  .pipe gulp.dest 'public/js'

