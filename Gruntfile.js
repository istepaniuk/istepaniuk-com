module.exports = function(grunt) {
  grunt.initConfig({
    htmllint: {
        all: [
          '/var/www/blog/**/*.html'
        ]
    }
  });
  grunt.loadNpmTasks('grunt-html');
  grunt.registerTask('test', ['htmllint']);
};
