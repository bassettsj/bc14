paths = require('./paths')
module.exports = (gulp) ->
  gulp.task('dev',['default', 'docs-preview'], ->
    gulp.watch(paths.scripts.watch, ['srcipts'] )
    gulp.watch(paths.css.src, ['css'])
    gulp.watch(paths.docs.assets + '/**/*', ['copy'])
  )
