express = require 'express'
path = require 'path'

app = express()

# logger
app.use express.logger 'dev'

# static files
client_root = path.join __dirname, '..', 'client'
app.use express.static path.join client_root, 'html'
app.use '/js', express.static path.join client_root, 'js'
app.use '/css', express.static path.join client_root, 'css'

app.listen 8080
