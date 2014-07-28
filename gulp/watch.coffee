paths = require('./paths')
module.exports = (gulp) ->
  gulp.task('watch',['default'], ->
    gulp.watch(paths.scripts.watch, ['srcipts'] )
    gulp.watch(paths.css.src, ['css'])
  )
