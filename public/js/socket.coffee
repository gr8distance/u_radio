
#SocketIOのファイルを読み込む
socket = io.connect('http://localhost')

#なんにでも使えるputs関数
puts = (s)->
	console.log s

$ ->
	
	#変数の宣言
	comments_holder = $("#comments_holder")
	comments = $("#comments")

	send_comment = ->
		comment = $("#comment").val()
		socket.emit("new",comment)
		$("#comment").val("")

	$("#btn").on("click",send_comment)

	socket.on("return_comment",(data)->
		puts data
		$(".comments").prepend("<div class='card'><div class='card-content'><p>#{data}</p></div></div>")
	)
