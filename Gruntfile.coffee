module.exports = (grunt) ->
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')
    coffee:
      coffee_to_js:
        options:
          bare: true
          sourceMap: true
        expand: true
        flatten: false
        cwd: "app"
        src: ["**/*.coffee"]
        dest: 'app'
        ext: ".js"
    watch:
      coffeescript:
        files: 'app/**/*.coffee'
        tasks: ["newer:coffee"]
      compile:
        files: 'app/**/*.coffee'
        tasks: ["newer:coffee"]
    protractor:
      options:
        configFile: "./spec/conf.js"
        noColor: false
        args: {}
      e2e:
        options:
          keepAlive: true
  })

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-newer'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'compile', ['coffee']
  grunt.registerTask 'default', ['coffee', 'watch:compile']
  grunt.registerTask 'protractor-test', ['protractor:e2e']