(function($){

	/**
	 * If the form contains the class "delegatable",
	 * that will change the form action on the contents
	 * of the tag "data-ur" all the buttons.
	 */
	$(function(){

		$('form.delegatable').each(function(){
			var jForm = $(this);
			$('button[data-url]').each(function(){
				var jButton = $(this);
				jButton.bind('click', function(){
					jForm.attr('action', jButton.attr('data-url'));
					return true;
				});
			});
		});
	});


})(jQuery);
