module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      coffee_to_js: {
        options: {
          bare: true,
          sourceMap: true
        },
        expand: true,
        flatten: false,
        src: ["**/*.coffee"],
        dest: 'app',
        ext: ".js"
      }
    },
    watch: {
      coffeescript: {
        files: ['app/**/*.coffee', 'spec/**/*.coffee'],
        tasks: ["newer:coffee"]
      },
      compile: {
        files: 'app/**/*.coffee',
        tasks: ["newer:coffee"]
      }
    },
    protractor: {
      options: {
        configFile: "./spec/conf.js",
        noColor: false,
        args: {},
        message: 'grunting protractor'
      },
      e2e: {
        options: {
          keepAlive: false
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-newer');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-protractor-runner');
  grunt.registerTask('compile', ['coffee']);
  grunt.registerTask('default', ['coffee', 'watch:compile']);
  return grunt.registerTask('protractor-test', ['protractor:e2e']);
};

//# sourceMappingURL=Gruntfile.js.map
