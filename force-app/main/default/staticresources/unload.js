window.onbeforeunload = function() {
  if (!validNavigation) {
	 endSession();
  }
}