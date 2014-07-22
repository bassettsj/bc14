browserify = require('gulp-browserify')
rename = require('gulp-rename')
uglify = require('gulp-uglify')
yargs = require('yargs')
pkg = require('../package.json')
paths = require('./paths')
sourcemaps = require('gulp-sourcemaps')
module.exports = (gulp) ->
  gulp.task('scripts', ->
    return gulp.src(paths.scripts.src, {read: false})
    .pipe(browserify({
      debug: !yargs.prod
      transform: [
        'coffeeify'
      ]
      extensions: ['.coffee'],
    }))
    .pipe(sourcemaps.init())
    .pipe(rename("#{pkg.name}.pkg.js"))
    .pipe(gulp.dest(paths.scripts.dest))
    .pipe(uglify())
    .pipe(rename({suffix:'.pkg.min.js'}))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(paths.scripts.dest))

  )

  return gulp
