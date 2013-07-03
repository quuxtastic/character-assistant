module.exports = require(process.env['LINEMAN_MAIN']).config.extend 'files',
    ngtemplates:
        dest: 'generated/angular/template-cache.js'
        
    less:
        compile:
            options:
                path: [
                    'vendor/css/normalize.css',
                    'vendor/css/**/*.css',
                    'app/css/**/*.less'
                ]