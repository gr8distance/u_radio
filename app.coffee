#######Basic
express = require("express")
app = express()
server = require('http').Server(app)
io = require('socket.io')(server)

############## Utilities
routes_of_get = require("./config/routes")
puts = (s) ->
	console.log s

############## App.sets
app.set('views',"#{__dirname}/app/views/")
app.set("view engine","jade")
app.use(express.static("#{__dirname}/public"))


#####Routing instance
routes_of_get.forEach((r)->
	app.get(r.path,r.func)
)

#####SocketIO Codes
io.on("connection",(socket)->

	socket.emit("news","Hello world")

	socket.on("wait",(data)->
		puts data
	)

	socket.on("send",(data)->
		puts data
	)
)

####Server is running
server.listen(3000)
puts "SocketIO is running"


