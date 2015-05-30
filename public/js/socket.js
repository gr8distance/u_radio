$(function(){

	var socket = io.connect('http://localhost');

	socket.on('news', function (data) {

		console.log(data);
		socket.emit("wait", "Hello world");
	});

	$("#btn").on("click",function(){
		var c = $("#name").val();
		socket.emit("send",c)
		$("#name").val("");
	});

});
