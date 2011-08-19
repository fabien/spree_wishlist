$(function() {

$("#new_wished_product").submit(function() {
  selected_variant_id = $("#product-variants input[type=radio]:checked").val();
  if (selected_variant_id) {
    $("#wished_product_variant_id").val(selected_variant_id);
  }
});


$("form#change_wishlist_accessibility").submit(function() {
	$.post($(this).attr("action"), $(this).serialize(), null, "script");
	return false;
});

$("form#change_wishlist_accessibility input[type=radio]").click(function() {
	$(this).parent().submit();
});

$("table#wishlist td.notify form input[type=submit]").hide();

$("table#wishlist td.notify form").submit(function() {
	$.post($(this).attr("action"), $(this).serialize(), null, "script");
	return false;
});

$("table#wishlist td.notify form input[type=checkbox]").click(function() {
	$(this).parent().submit();
});

});