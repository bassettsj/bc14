wintersmith = require('wintersmith')
config = require('../docs/config')
gutil = require('gulp-util')
_ = require('underscore')
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
  gulp.task('docs-build', (cb)->
    prod = _.clone(config)
    prod.baseUrl = '/bc14/'
    env.reset()
    env.setConfig(prod)
    env.build((error, reset) ->
      if error
        gutil.log(error)
      else
        gutil.log('Sucessfully built!')
    )
    cb()
  )

  return gulp
