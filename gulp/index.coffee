gulp = require('gulp')
ghPages = require('gulp-gh-pages')
paths = require('./paths')
del = require('del')
require('./css')(gulp)

require('./scripts')(gulp)
require('./watch')(gulp)

gulp.task('clean', (cb) ->
  del([
    paths.build
    paths.docs.assets
  ], cb)
)
gulp.task('compile', ['scripts','css'])

gulp.task('default', [
  'clean'
  'compile'
])


gulp.task('deploy', ['default'], ->
  gulp.src(paths.docs.src)
  .pipe(ghPages({
    remoteUrl: 'git@github.com:bassettsj/bc14.git'
    origin: 'origin'
    branch: 'gh-pages'
    push: true
  }))
)

module.exports = gulp
