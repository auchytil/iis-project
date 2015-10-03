# Gruntfile that will watch for any static changes and reflect them into tmp
#
# @author Gelidus <gelidus@flowup.eu> & Albert Uchytil <albert.uchytil@flowup.eu>
# @version 1.0 : 30.8.2015

module.exports = (grunt) ->
  grunt.initConfig
    ts:
      app:
        files : [
            src: ['source/**/*.ts']
            dest: ['static/scripts/src/']
        ]
        options:
          target: 'es3'
          sourceMaps: false
          declaration: true
          removeComments: false
          fast: 'never'

    sass:
      dist:
        options:
          style: "expanded"
        files: [
          {
            expand: true
            cwd: "source/style"
            src: ["app.scss"]
            dest: "static/style"
            ext: ".css"
          }
        ]

    uglify:
      platform:
        options:
          beautify: true
          mangle: false
        files:
          'static/scripts/app.min.js': [
            'static/scripts/src/app.js'
            'static/scripts/src/services/**/*.js'
            'static/scripts/src/directives/**/*.js'
            'static/scripts/src/controllers/**/*.js'
          ]

    bower:
      install: {}
      options:
        targetDir: "static/bower_components"

    watch:
      ts:
        files: 'source/scripts/**'
        tasks: ['ts', 'uglify']
      less:
        files: 'source/style/**'
        tasks: ['sass']
      bower:
        files: 'bower.json'
        tasks: ['bower']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-ts'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-bower-task'

  # Default task.
  grunt.registerTask 'default', ['ts', 'sass', 'uglify', 'bower']
