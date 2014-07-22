module.exports =
  build: 'dist'
  css:
    src: 'scss/**/*.scss'
    dest: 'dist/css'
    includes: [
      'node_modules'
    ]
    csslintrc: 'scss/.csslintrc.json'
  scripts:
    src: 'scripts/index.coffee'
    dest: 'dist/js'
    watch: 'scripts/**/*.{coffee,js}'
  docs:
    src: 'docs/_gh_pages/**/*'
    assets: 'docs/contents/dist'
