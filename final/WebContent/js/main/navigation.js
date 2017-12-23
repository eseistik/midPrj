[].slice.call(document.querySelectorAll('.dropdown .nav-link')).forEach(
		function(el) {
			el.addEventListener('mouseover', onClick, false);
		});

function onClick(e) {
	e.preventDefault();
	var el = this.parentNode;
	el.classList.contains('show-submenu') ? hideSubMenu(el) : showSubMenu(el);
}

function showSubMenu(el) {
	el.classList.add('show-submenu');
	document.addEventListener('mouseover', function onDocClick(e) {
		e.preventDefault();
		if (el.contains(e.target)) {
			return;
		}
		document.removeEventListener('mouseremove', onDocClick);
		hideSubMenu(el);
	});
}

function hideSubMenu(el) {
	el.classList.remove('show-submenu');
}