---
layout: default
title: فضولي
---

<meta http-equiv="refresh" content="2;url=https://www.abdnh.net/fuduli-clock/">
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
	const rect = logo.getBoundingClientRect();
	const dx = document.documentElement.clientWidth / 2 - (rect.left + rect.width / 2);
	const dy = document.documentElement.clientHeight / 2 - (rect.top + rect.height / 2);
	logo.style.transform = `translate(${dx}px, ${dy}px) scale(5)`;
</script>
