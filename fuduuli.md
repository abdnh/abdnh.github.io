---
layout: default
title: فضولي
---

<meta http-equiv="refresh" content="2;url=/fuduuli-clock/">
<style>
	#nav-links {
		position: absolute;
		transition: transform 0.5s 0s linear;
	}
	#logo {
		position: absolute;
		transition: transform 0.5s 0s linear;
	}
	#footer-links {
		display: none;
	}
</style>
<script>
	const navLinks = document.getElementById("nav-links");
	navLinks.style.transform = 'translateY(-200px)';
    navLinks.style.transform += 'translateX(150px)';
	navLinks.style.transform += 'rotate(0.25turn)';
	const logo = document.getElementById("logo");
	logo.parentElement.removeAttribute('href');
	logo.style.transform = 'translateY(200px)';
    logo.style.transform += 'translateX(-40vw)';
	logo.style.transform += 'scale(5)';
</script>
