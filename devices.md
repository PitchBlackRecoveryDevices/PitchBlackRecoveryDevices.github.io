---
layout: default
permalink: /devices/
redirect_to: "/#devices"
---

<script>
// Immediate redirect
if (window.location.pathname.includes('/devices')) {
  window.location.replace("/#devices");
}
</script>

<meta http-equiv="refresh" content="0; url=/#devices">

<div class="min-h-[50vh] flex flex-col items-center justify-center text-center">
  <i class="fas fa-circle-notch fa-spin text-4xl text-pbrp-red mb-4"></i>
  <h2 class="text-2xl font-bold text-white">Redirecting...</h2>
  <p class="text-gray-500 mt-2">Taking you to the device list.</p>
  <p class="text-sm mt-4">
    <a href="/#devices" class="text-pbrp-purple hover:underline">Click here if not redirected</a>
  </p>
</div>
