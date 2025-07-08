---
layout: default
permalink: /downloads/
redirect_to: "/#devices"
---

<script>
// Handle both hash-based and path-based downloads URLs
(function() {
  const currentPath = window.location.pathname;
  const currentHash = window.location.hash;
  
  // If we're on /downloads/ or /downloads, redirect to /#devices
  if (currentPath === '/downloads' || currentPath === '/downloads/') {
    window.location.replace("/#devices");
    return;
  }
  
  // If we're on the homepage with #downloads hash, redirect to #devices
  if (currentHash === '#downloads') {
    window.location.replace("/#devices");
    return;
  }
})();
</script>

<noscript>
<meta http-equiv="refresh" content="0; url=/#devices">
</noscript>

<!-- Fallback content -->
<div class="container text-center py-5">
  <h2>Redirecting to Downloads...</h2>
  <p>If you are not redirected automatically, <a href="/#devices">click here to view downloads</a>.</p>
</div>