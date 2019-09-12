	function translate(index)
	{	
		var values = dictionary;
		if(typeof values[index] == 'undefined'){
			alert('ready');
		}else{
			var obj = values[index];
			var $source = $('#source');
			$source.val(obj.value);
			setTimeout(function(){
				var $resbox = $('#result_box');
				var translation = $resbox.text();
				send_translation(obj.key, translation);
				index++;
				translate(index);
			}, 5000);
		}
	}

	function send_translation(key, value)
	{
		var script = document.createElement('script');
		script.type='text/javascript';
//		script.src = 'http://dev.2/api/translate?key=' + key + '&value=' + value;
//		alert(script.src);
		script.src = 'https://dev.2/js/test.js';
//		document.body.appendChild(script);
	}


	translate(0);