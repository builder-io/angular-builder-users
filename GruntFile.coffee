module.exports = (grunt) ->

  # Config
  grunt.initConfig
    conf:
      paths:
        coffee: ['src/**/*.coffee']
        gruntFile: 'GruntFile.coffee'
      dirs:
        dist: 'dist'

    pkg: grunt.file.readJSON 'package.json'

    watch:
      coffee:
        files: ['<%= conf.paths.coffee %>', '<%= conf.paths.gruntFile %>']
        tasks: ['coffeelint']

    coffee:
      src:
        files:
          '<%= conf.dirs.dist %>/<%= pkg.name %>.js': '<%= conf.paths.coffee %>'

    coffeelint:
      options:
        arrow_spacing: level: 'error'
        camel_case_classes: level: 'error'
        no_empty_param_list: level: 'error'
        no_throwing_strings: level: 'error'
        no_tabs: level: 'error'
        space_operators: level: 'error'
        no_unnecessary_fat_arrows: level: 'ignore'

      src: '<%= conf.paths.coffee %>'
      gruntFile: '<%= conf.paths.gruntFile %>'

    clean:
      dist: '<%= conf.dirs.dist %>'

    bump:
      options:
        files: ['package.json', 'bower.json']
        commit: true
        commitMessage: 'chore(release): v%VERSION%'
        commitFiles: ['package.json', 'bower.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: true
        pushTo: 'origin'

  # NPM tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-bump'

  # Aliases
  grunt.registerTask 'build', ['coffeelint', 'clean', 'coffee']
  grunt.registerTask 'build:patch', ['bump:patch', 'build']
  grunt.registerTask 'build:minor', ['bump:minor', 'build']
  grunt.registerTask 'build:major', ['bump:major', 'build']

  grunt.registerTask 'default', ['build']
