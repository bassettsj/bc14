sass = require('gulp-sass')
prefixer = require('gulp-autoprefixer')
csslint = require('gulp-csslint')
csscomb = require('gulp-csscomb')
cssmin = require('gulp-cssmin')
paths = require('./paths')
rename = require('gulp-rename')
module.exports = (gulp) ->

  gulp.task('css', ->
    gulp.src(paths.css.src)
    .pipe(sass({
      includePaths:paths.css.inlcudes
      sourceMap: 'map'
      }))
    .pipe(prefixer("last 1 version", "> 1%", "ie 8", "ie 7", { cascade: true } ))
    .pipe(gulp.dest(paths.css.dest))
    .pipe(csscomb())
    .pipe(csslint(paths.css.csslintrc))
    .pipe(csslint.reporter())
    .pipe(cssmin())
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest(paths.css.dest))
  )
