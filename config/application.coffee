module.exports = require(process.env['LINEMAN_MAIN']).config.extend 'application',
    loadNpmTasks: [
        'grunt-angular-templates',
        'grunt-ngmin'
    ]
    
    removeTasks:
        common: [
            'handlebars'
        ]
        
    prependTasks:
        dist: [
            'ngmin'
        ]
        common: [
            'ngtemplates'
        ]
        
    ngtemplates:
        app:
            options:
                base: 'app/templates'
            src: 'app/templates/**/*.html'
            dest: 'generated/angular/template-cache.js'
            
    ngmin:
        js:
            src: '<%= files.js.concatenated %>'
            dest: '<%= files.js.concatenated %>'
            
    concat:
        js:
            src: [
                '<banner:meta.banner>',
                '<%= files.js.vendor %>',
                '<%= files.coffee.generated %>',
                '<%= files.js.app %>',
                '<%= files.ngtemplates.dest %>'
            ]
            separator: ';'
    
    watch:
        ngtemplates:
            files: 'app/templates/**/*.html'
            tasks: [
                'ngtemplates',
                'concat'
            ]
            
    server:
        web:
            port:process.env['PORT']
