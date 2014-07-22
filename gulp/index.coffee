gulp = require('gulp')
ghPages = require('gulp-gh-pages')
paths = require('./paths')
del = require('del')
require('./css')(gulp)
require('./docs')(gulp)
require('./scripts')(gulp)
require('./watch')(gulp)

gulp.task('clean', (cb) ->
  del([
    paths.build
    paths.docs.assets
    './docs/_gh_pages'
  ], cb)
)
gulp.task('compile', (cb)->
  gulp.run(['scripts','css'])
  cb()
)
gulp.task('default', [
  'clean'
  'compile'
])

gulp.task('copy', (cb)->
  gulp.src("#{paths.build}/**/*")
  .pipe(gulp.dest(paths.docs.assets))
)

gulp.task('deploy', [
  'default'
  'copy'
  'docs-build'
  ], ->
  gulp.src(paths.docs.src)
  .pipe(ghPages())
)

module.exports = gulp
