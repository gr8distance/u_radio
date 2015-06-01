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
	
	socket.on("new",(data)->
		puts data
			
		#io.sockets.emitで自分も含めたすべてに配信
		io.sockets.emit("return_comment",data)

		#socket.broadcast.emitで自分以外の全てに送信

		#socket.emitは同一の名前を持つ相手になにかを送信
	)
)

####Server is running
server.listen(3000)
puts "SocketIO is running"


