module.exports =
  build: 'dist'
  css:
    src: 'scss/**/*.scss'
    # dest: 'dist/css'
    dest: 'docs/contents/dist/css'
    includes: [
      '../node_modules'
      '../bower_components'
    ]
    csslintrc: 'scss/.csslintrc.json'
  scripts:
    src: 'scripts/index.coffee'
    dest: 'docs/contents/dist/js'
    watch: 'scripts/**/*.{coffee,js}'
  docs:
    src: 'docs/_gh_pages/**/*'
    assets: 'docs/contents/dist'
