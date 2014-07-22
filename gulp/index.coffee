gulp = require('gulp')
ghPages = require('gulp-gh-pages')
paths = require('./paths')
require('./css')(gulp)
require('./docs')(gulp)
require('./scripts')(gulp)
require('./watch')(gulp)

gulp.task('clean', (cb) ->
  del(paths.build, cb)
)

gulp.task('default', [
  'css'
  'scripts'
  'docs-build'
])

gulp.task('copy', ->
  gulp.src("#{paths.build}/**/*")
  .pipe(gulp.dest(paths.docs.assets))
)

gulp.task('deploy', ['default', 'copy'], ->
  gulp.src(paths.docs.src)
  .pipe(ghPages())
)

module.exports = gulp
