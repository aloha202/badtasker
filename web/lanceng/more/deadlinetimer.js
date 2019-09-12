$(function () {

	var updateDeadline = function (end, jTimer) {
		var duration = moment.duration(end.diff(moment(), 'miliseconds'));
		$('.timed', jTimer).text(duration.days());
		$('.timeh', jTimer).text(duration.hours());
		$('.timem', jTimer).text(duration.minutes());
	};

	$('.deadline-timer').each(function () {
		var jTimer = $(this);
		var end = moment(jTimer.data('deadline'));
		updateDeadline(end, jTimer);
		setInterval(function () {
			updateDeadline(end, jTimer);
		}, 1000);
	});
});
