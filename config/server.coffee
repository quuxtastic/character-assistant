module.exports =
    drawRoutes: (app) ->
        app.post '/login', (req,res) ->
            res.json
                message: 'logging in!'
                
        app.post '/logout', (req,res) ->
            res.json
                message: 'logging out!'
