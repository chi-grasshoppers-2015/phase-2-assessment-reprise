$(document).ready(function() {
	$("#sidebar").on("submit", "#post_form",function(event) {
		event.preventDefault();
		var request = $.ajax({
			url: "/posts",
			method: "post",
			data: $("#post_form").serialize()
		});
		request.done(function(response) {
			$("#posts").prepend(response);
			$("#sidebar").find("input[type=text], textarea").val("");
		});
	});

	$("#posts").on("submit", ".post_like", function(event) {
		event.preventDefault();
		var clickedForm = this;
		var request = $.ajax({
			url: $(this).attr("action"),
			method: "put"
		});
		request.done(function(response) {
			var obj = $.parseJSON(response);
			$(clickedForm).parent().find(".like_count").html(obj["lc"]);
		})
	});
});