---
layout: default
permalink: /downloads/
redirect_to: "/#devices"
---

<script>
// Handle redirects
(function() {
  const path = window.location.pathname;
  const hash = window.location.hash;
  if (path.includes('/downloads') || hash === '#downloads') {
    window.location.replace("/#devices");
  }
})();
</script>

<meta http-equiv="refresh" content="0; url=/#devices">

<div class="min-h-[50vh] flex flex-col items-center justify-center text-center">
  <i class="fas fa-download text-4xl text-pbrp-red mb-4 animate-pulse"></i>
  <h2 class="text-2xl font-bold text-white">Redirecting...</h2>
  <p class="text-gray-500 mt-2">Moving to downloads section.</p>
  <p class="text-sm mt-4">
    <a href="/#devices" class="text-pbrp-purple hover:underline">Click here if not redirected</a>
  </p>
</div>
