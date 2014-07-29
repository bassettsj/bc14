sass = require('gulp-sass')
prefixer = require('gulp-autoprefixer')
csslint = require('gulp-csslint')
csscomb = require('gulp-csscomb')
cssmin = require('gulp-cssmin')
paths = require('./paths')
rename = require('gulp-rename')
kss = require('gulp-kss')
pkg = require('../package')
del = require('del')


module.exports = (gulp) ->
  gulp.task('css', ->
    del(paths.css.dest, ->
      s = gulp.src(paths.css.src)
      .pipe(sass({
        includePaths: paths.css.inlcudes
        sourceMap: 'map'
        }))
      .pipe(prefixer({ cascade: true }))
      .pipe(csscomb())
      .pipe(csslint(paths.css.csslintrc))
      .pipe(csslint.reporter())
      .pipe(rename(pkg.name + '.css'))
      .pipe(gulp.dest(paths.css.dest))
      .pipe(cssmin())
      .pipe(rename({suffix: '.min'}))
      .pipe(gulp.dest(paths.css.dest))
      .pipe(rename('style.css'))
      .pipe(gulp.dest('./styleguide/public'))

      gulp.src(paths.css.src).pipe(
        kss({
          overview:'./scss/styleguide.md'
          templateDirectory: './kss-template'
        })
      ).pipe( gulp.dest('./styleguide'))
    )


  )
