---
layout: default
title: "Build Flags - PitchBlack Recovery Project"
permalink: /docs/build-flags/
---

<div class="max-w-4xl mx-auto py-12 px-4">
  
  <div class="mb-10">
    <a href="/docs/" class="text-sm text-gray-500 hover:text-white mb-4 inline-block transition-colors"><i class="fas fa-arrow-left mr-2"></i> Back to Docs</a>
    <h1 class="text-4xl font-display font-bold text-white mb-4 border-l-4 border-pbrp-purple pl-4">Build Flags</h1>
    <p class="text-gray-400 text-lg">Custom flags to configure PBRP for your specific device tree in <code class="text-pbrp-red bg-white/10 px-2 py-0.5 rounded text-base">BoardConfig.mk</code>.</p>
  </div>

  <div class="space-y-6">

    <!-- Flag Item -->
    <div class="bg-zinc-900 border border-white/10 rounded-xl p-6 hover:border-white/20 transition-colors">
      <div class="flex justify-between items-start mb-4">
        <h3 class="text-xl font-bold text-white">Official Build</h3>
        <span class="px-2 py-1 rounded text-xs font-bold bg-green-500/20 text-green-400 border border-green-500/20">RECOMMENDED</span>
      </div>
      <p class="text-gray-400 mb-4">Marks the build as an Official release. This affects versioning string and branding.</p>
      <div class="bg-black rounded-lg border border-white/10 p-4 font-mono text-sm text-gray-300 overflow-x-auto">
        PB_OFFICIAL := true
      </div>
    </div>

    <!-- Flag Item -->
    <div class="bg-zinc-900 border border-white/10 rounded-xl p-6 hover:border-white/20 transition-colors">
      <div class="flex justify-between items-start mb-4">
        <h3 class="text-xl font-bold text-white">Disable Default DM-Verity</h3>
        <span class="px-2 py-1 rounded text-xs font-bold bg-blue-500/20 text-blue-400 border border-blue-500/20">OPTIONAL</span>
      </div>
      <p class="text-gray-400 mb-4">Disables dm-verity checks by default. useful for devices that fail to boot after modification.</p>
      <div class="bg-black rounded-lg border border-white/10 p-4 font-mono text-sm text-gray-300 overflow-x-auto">
        PB_DISABLE_DEFAULT_DM_VERITY := true
      </div>
    </div>

    <!-- Flag Item -->
    <div class="bg-zinc-900 border border-white/10 rounded-xl p-6 hover:border-white/20 transition-colors">
      <div class="flex justify-between items-start mb-4">
        <h3 class="text-xl font-bold text-white">Custom Torch Path</h3>
        <span class="px-2 py-1 rounded text-xs font-bold bg-yellow-500/20 text-yellow-400 border border-yellow-500/20">DEVICE SPECIFIC</span>
      </div>
      <p class="text-gray-400 mb-4">If the flashlight toggle doesn't work, you may need to specify the correct sysfs path.</p>
      <div class="bg-black rounded-lg border border-white/10 p-4 font-mono text-sm text-gray-300 overflow-x-auto">
        PB_TORCH_PATH := /sys/class/leds/flashlight
      </div>
    </div>

    <!-- Flag Item (Deprecated) -->
    <div class="bg-zinc-900/50 border border-white/5 rounded-xl p-6 opacity-75">
      <div class="flex justify-between items-start mb-4">
        <h3 class="text-lg font-bold text-gray-400 line-through">PBRP GO Support</h3>
        <span class="px-2 py-1 rounded text-xs font-bold bg-red-500/20 text-red-400 border border-red-500/20">DEPRECATED</span>
      </div>
      <p class="text-gray-500 mb-4">Was used for low-memory devices. Removed in PBRP 3.0.0+.</p>
      <div class="bg-black/50 rounded-lg border border-white/5 p-4 font-mono text-sm text-gray-600 overflow-x-auto select-none">
        PB_GO := TRUE
      </div>
    </div>

  </div>
</div>
