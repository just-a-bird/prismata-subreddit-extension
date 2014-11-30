gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
jasmine = require 'gulp-jasmine-phantom'
jasminePhantomJs = require 'gulp-jasmine2-phantomjs'

sources =
  watch: ['./src/**/*.coffee', './spec/**/*.coffee']
  backgrounds: [
    './src/bg/**/!(run)*.coffee'
    './src/bg/run.coffee'
  ]
  
  injects: [
    './src/inject/**/!(run)*.coffee'
    './src/inject/run.coffee'
  ]

  tests: [
    './src/**/!(run)*.coffee'
    './spec/**/*.coffee'
  ]

  specRunner: './spec/spec_runner.html'

destinations =
  background: './src/bg/'
  inject: './src/inject/'
  test: './spec/'
  concat: 'all.js'

gulp.task 'coffee', ->
  gulp.src(sources.injects)
    # We concat first so we don't need to clutter
    # the global space with global variables
    .pipe(concat(destinations.concat))
    .pipe(coffee())
    .pipe(gulp.dest(destinations.inject))

  gulp.src(sources.backgrounds)
    .pipe(concat(destinations.concat))
    .pipe(coffee())
    .pipe(gulp.dest(destinations.background))

  gulp.src(sources.tests)
    .pipe(concat(destinations.concat))
    .pipe(coffee())
    .pipe(gulp.dest(destinations.test))
    .pipe(jasmine())

  # gulp.src(sources.specRunner)
  #   .pipe(jasminePhantomJs())
  #   .on 'error', (err)->
  #     console.log arguments
  #     this.emit 'end'

gulp.task 'watch', ->
  gulp.watch sources.watch, ['coffee']

gulp.task 'default', [
  'watch'
]