wintersmith = require('wintersmith')
config = require('../docs/config')
gutil = require('gulp-util')
module.exports = (gulp) ->
  env = wintersmith(config)
  gulp.task('docs-preview', ->

    env.preview((error, server)->
      if error
        gutil.log(error)
      else
        gutil.log('Preview started')
    )
  )

  gulp.task('docs-build', ->
    env.build((error) ->
      if error
        gutil.log(error)
      else
        gutil.log('Sucessfully built!')
    )
  )

  return gulp
