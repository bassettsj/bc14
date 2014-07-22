wintersmith = require('wintersmith')
config = require('../docs/config')
gutil = require('gulp-util')



module.exports = (gulp) ->

  gulp.task('docs-preview', ->
    env = wintersmith(config)
    env.preview((error, server)->
      if error
        gutil.log(error)
      else
        gutil.log('Preview started')
    )
  )
  gulp.task('docs-build', ['clean', 'compile', 'copy'], (cb)->
    config.baseurl = '/bc14/'
    config.locals.url = 'http://bassettsj.me/bc14'
    env = wintersmith(config)
    env.build((error, reset) ->
      if error
        gutil.log(error)
      else
        gutil.log('Sucessfully built!')
    )
    cb()
  )

  return gulp
