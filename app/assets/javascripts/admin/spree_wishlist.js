$(function() {

$("table#wishlist td.notify form input[type=submit]").hide();

$("table#wishlist td.notify form").submit(function() {
	$.post($(this).attr("action"), $(this).serialize(), null, "script");
	return false;
});

$("table#wishlist td.notify form input[type=checkbox]").click(function() {
	$(this).parent().submit();
});

});