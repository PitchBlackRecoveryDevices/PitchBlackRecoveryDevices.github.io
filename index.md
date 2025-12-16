---
layout: default
title: "PitchBlack Recovery Project"
---

<!-- Hero Section -->
<section id="home" class="relative min-h-[70vh] flex flex-col items-center justify-center text-center px-4 overflow-hidden border-b border-white/5">
  <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-pbrp-purple/10 rounded-full blur-[100px] -z-10"></div>
  
  <!-- Updated Title: 'PitchBlack' is now Gradient -->
  <h1 class="text-4xl md:text-6xl lg:text-7xl font-display font-black text-white mb-6 leading-tight">
    <span class="text-gradient">PitchBlack</span> Recovery Project
  </h1>
  
  <p class="text-lg md:text-xl text-gray-400 max-w-2xl mb-10 font-light">
    The Perfect Android Recovery for your device! PBRP provides the most advanced Open Source Android Recovery to troubleshoot your device on the GO!
  </p>

  <div class="flex flex-col sm:flex-row gap-4">
    <a href="#devices" class="px-8 py-3 rounded-full bg-gradient-primary text-white font-bold shadow-lg hover:scale-105 transition-transform">
      <i class="fas fa-download mr-2"></i>Download Now
    </a>
    <a href="#donate" class="px-8 py-3 rounded-full bg-white/5 border border-white/10 text-white font-bold hover:bg-white/10 transition-colors">
      <i class="fas fa-heart mr-2"></i>Donate
    </a>
  </div>
</section>

<!-- About Section -->
<section id="about" class="py-20 px-4 max-w-7xl mx-auto">
  <div class="text-center mb-16">
    <h2 class="text-3xl font-display font-bold text-white mb-4 text-gradient">About PBRP</h2>
    <p class="text-gray-400 max-w-2xl mx-auto">
      PitchBlack Recovery Project is an Open Source organization founded on 28th March 2018 by developers from different countries with an aim to provide the world's most advanced recovery with better customization's, themes and features.
    </p>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <!-- Feature Cards -->
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-pbrp-red/50 transition-colors">
      <i class="fas fa-tools text-3xl text-pbrp-red mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Advanced Toolbox</h3>
      <p class="text-gray-400 text-sm">PBRP provides 10+ tools that come in handy when working with your device, including Magisk Manager integration.</p>
    </div>
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-pbrp-purple/50 transition-colors">
      <i class="fas fa-mobile-alt text-3xl text-pbrp-purple mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Wide Device Support</h3>
      <p class="text-gray-400 text-sm">Supports a wide range of devices with Treble, ARB Support, Force Encryption and much more.</p>
    </div>
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-blue-500/50 transition-colors">
      <i class="fas fa-paint-brush text-3xl text-blue-500 mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Theme Support</h3>
      <p class="text-gray-400 text-sm">Customize PBRP according to your needs using PBRP Theme Engine™.</p>
    </div>
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-green-500/50 transition-colors">
      <i class="fas fa-layer-group text-3xl text-green-500 mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Material Design UI</h3>
      <p class="text-gray-400 text-sm">Best in class material design interface for the latest Android experience.</p>
    </div>
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-yellow-500/50 transition-colors">
      <i class="fas fa-sync text-3xl text-yellow-500 mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Latest TWRP Base</h3>
      <p class="text-gray-400 text-sm">Based on TWRP 3.7.1 with support for both modern and legacy devices.</p>
    </div>
    <div class="p-6 rounded-xl bg-zinc-900 border border-white/5 hover:border-pink-500/50 transition-colors">
      <i class="fas fa-language text-3xl text-pink-500 mb-4"></i>
      <h3 class="text-xl font-bold text-white mb-2">Multi-Language</h3>
      <p class="text-gray-400 text-sm">Official support for 10+ languages that are updated and improved regularly!</p>
    </div>
  </div>
</section>

<!-- Requirements Section -->
<section id="requirements" class="py-20 bg-zinc-900/50 border-y border-white/5">
  <div class="max-w-4xl mx-auto px-4">
    <h2 class="text-3xl text-center font-display font-bold text-white mb-10 text-gradient">Installation Requirements</h2>
    
    <div class="bg-black border border-white/10 rounded-xl p-8">
      <ul class="space-y-4">
        <li class="flex items-center gap-4 text-gray-300">
          <i class="fas fa-unlock-alt text-pbrp-red text-xl w-6 text-center"></i>
          <span>Unlocked bootloader (device-specific process)</span>
        </li>
        <li class="flex items-center gap-4 text-gray-300">
          <i class="fas fa-bug text-pbrp-red text-xl w-6 text-center"></i>
          <span>USB debugging enabled</span>
        </li>
        <li class="flex items-center gap-4 text-gray-300">
          <i class="fas fa-terminal text-pbrp-red text-xl w-6 text-center"></i>
          <span>ADB and Fastboot tools installed on your computer</span>
        </li>
        <li class="flex items-center gap-4 text-gray-300">
          <i class="fas fa-usb text-pbrp-red text-xl w-6 text-center"></i>
          <span>Proper USB drivers for your device</span>
        </li>
        <li class="flex items-center gap-4 text-gray-300">
          <i class="fas fa-save text-pbrp-red text-xl w-6 text-center"></i>
          <span>A complete backup of your important data</span>
        </li>
      </ul>
      
      <div class="mt-8 bg-orange-900/20 border-l-4 border-orange-500 p-4 rounded-r-lg">
        <p class="text-orange-200 text-sm">
          <strong>Warning:</strong> Installing a custom recovery may void your warranty. Always follow device-specific guides.
        </p>
      </div>
    </div>
  </div>
</section>

<!-- Devices Section -->
<section id="devices" class="py-20 px-4 max-w-5xl mx-auto">
  <div class="text-center mb-12">
    <h2 class="text-3xl font-display font-bold text-white mb-4 text-gradient">Supported Devices</h2>
    
    <!-- Search -->
    <div class="relative max-w-xl mx-auto mt-8">
      <i class="fas fa-search absolute left-4 top-1/2 -translate-y-1/2 text-gray-500"></i>
      <input type="text" id="device-search" onkeyup="filterDevices()" 
        class="w-full bg-zinc-900 text-white pl-12 pr-4 py-4 rounded-xl border border-white/10 focus:outline-none focus:border-pbrp-red transition-colors" 
        placeholder="Search devices (e.g. 'alioth' or 'OnePlus')...">
    </div>
  </div>

  <!-- Device List -->
  <div class="space-y-3" id="device-list">
    {% assign oem_groups = site.oem | group_by:"oem" %}
    {% for group in oem_groups %}
    <div class="oem-section border border-white/10 rounded-xl bg-zinc-900 overflow-hidden">
      <button class="w-full px-6 py-4 flex items-center justify-between hover:bg-white/5 transition-colors oem-toggle" 
              onclick="toggleOem(this)">
        <span class="font-bold text-lg text-white capitalize flex items-center gap-3">
          {{ group.name }}
          <span class="text-xs bg-white/10 px-2 py-0.5 rounded text-gray-400 font-normal">{{ group.items.size }}</span>
        </span>
        <i class="fas fa-chevron-down text-gray-500 transition-transform duration-300"></i>
      </button>
      
      <div class="device-list hidden bg-black/50 p-2 border-t border-white/10 grid grid-cols-1 md:grid-cols-2 gap-2">
        {% for device in group.items %}
        <a href="{{ device.url | relative_url }}" 
           class="device-item flex items-center justify-between p-3 rounded hover:bg-white/10 transition-colors"
           data-title="{{ device.title | downcase }}" 
           data-codename="{{ device.codename | downcase }}">
           <div>
             <div class="text-white font-medium">{{ device.title }}</div>
             <div class="text-xs text-gray-500 font-mono">{{ device.codename }}</div>
           </div>
           <i class="fas fa-chevron-right text-gray-600 text-sm"></i>
        </a>
        {% endfor %}
      </div>
    </div>
    {% endfor %}
  </div>
  
  <div id="no-results" class="hidden text-center py-8 text-gray-500">No devices found.</div>
</section>

<!-- Community -->
<section id="community" class="py-20 bg-zinc-900/50">
  <div class="max-w-4xl mx-auto px-4 text-center">
    <h2 class="text-3xl font-display font-bold text-white mb-10 text-gradient">Join Our Community</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <a href="https://t.me/pbrpcom" target="_blank" class="p-8 rounded-2xl bg-black border border-white/10 hover:border-blue-500/50 group transition-all">
        <i class="fab fa-telegram text-5xl text-blue-500 mb-4 group-hover:scale-110 transition-transform"></i>
        <h3 class="text-xl font-bold text-white mb-2">Telegram</h3>
        <p class="text-gray-400">Join our active Telegram community for support and updates</p>
      </a>
      <a href="https://github.com/PitchBlackRecoveryProject" target="_blank" class="p-8 rounded-2xl bg-black border border-white/10 hover:border-gray-500/50 group transition-all">
        <i class="fab fa-github text-5xl text-white mb-4 group-hover:scale-110 transition-transform"></i>
        <h3 class="text-xl font-bold text-white mb-2">GitHub</h3>
        <p class="text-gray-400">Contribute to development and report issues</p>
      </a>
    </div>
  </div>
</section>

<!-- Donate -->
<section id="donate" class="py-20 px-4">
  <div class="max-w-3xl mx-auto text-center p-10 rounded-3xl bg-gradient-to-br from-zinc-900 to-black border border-white/10 shadow-2xl">
    <h2 class="text-3xl font-display font-bold text-white mb-4">Support PBRP</h2>
    <p class="text-xl text-pbrp-red font-bold mb-6">YOUR DONATION MATTERS A LOT TO US!</p>
    <p class="text-gray-400 mb-8">We are a group of people giving our valuable time to this self-less service only for YOU. We need your Support to keep PBRP alive!</p>
    
    <div class="flex flex-col sm:flex-row justify-center gap-4">
      <a href="https://www.patreon.com/pitchblackrecovery" target="_blank" class="px-6 py-3 rounded-full bg-[#f96854] text-white font-bold hover:bg-[#da5a48] transition-colors">
        <i class="fab fa-patreon mr-2"></i> Patreon
      </a>
      <a href="https://opencollective.com/pitchblackrecovery" target="_blank" class="px-6 py-3 rounded-full bg-white/10 border border-white/20 text-white font-bold hover:bg-white/20 transition-colors">
        <i class="fas fa-hand-holding-heart mr-2"></i> Open Collective
      </a>
    </div>
  </div>
</section>

<!-- FAQ -->
<section id="faq" class="py-20 bg-zinc-900/30">
  <div class="max-w-3xl mx-auto px-4">
    <h2 class="text-3xl text-center font-display font-bold text-white mb-10 text-gradient">FAQ</h2>
    
    <div class="space-y-4">
      <!-- FAQ Item 1 -->
      <div class="faq-item border border-white/10 rounded-xl bg-black overflow-hidden">
        <button class="faq-question w-full text-left px-6 py-4 font-bold text-white flex justify-between items-center hover:bg-white/5 transition-colors" onclick="toggleFaq(this)">
          What is PBRP?
          <i class="fas fa-plus text-pbrp-red transition-transform duration-300"></i>
        </button>
        <div class="faq-answer hidden px-6 py-4 text-gray-400 border-t border-white/5 text-sm leading-relaxed">
          PitchBlack Recovery Project is a feature-rich custom recovery, based on TWRP 3.7.1, designed to offer a unique black-themed interface and improved functionality. It provides tools for backup, restore, and system modification operations.
        </div>
      </div>

      <!-- FAQ Item 2 -->
      <div class="faq-item border border-white/10 rounded-xl bg-black overflow-hidden">
        <button class="faq-question w-full text-left px-6 py-4 font-bold text-white flex justify-between items-center hover:bg-white/5 transition-colors" onclick="toggleFaq(this)">
          How do I install PBRP?
          <i class="fas fa-plus text-pbrp-red transition-transform duration-300"></i>
        </button>
        <div class="faq-answer hidden px-6 py-4 text-gray-400 border-t border-white/5 text-sm leading-relaxed">
          Installation methods vary by device. Common methods include fastboot, Odin (Samsung devices), or SP Flash Tool (MediaTek devices). Always follow the device-specific installation guide available on your device's download page.
        </div>
      </div>

      <!-- FAQ Item 3 -->
      <div class="faq-item border border-white/10 rounded-xl bg-black overflow-hidden">
        <button class="faq-question w-full text-left px-6 py-4 font-bold text-white flex justify-between items-center hover:bg-white/5 transition-colors" onclick="toggleFaq(this)">
          Is PBRP safe?
          <i class="fas fa-plus text-pbrp-red transition-transform duration-300"></i>
        </button>
        <div class="faq-answer hidden px-6 py-4 text-gray-400 border-t border-white/5 text-sm leading-relaxed">
          Yes, PBRP is safe when used correctly. We recommend always creating a backup before making system modifications. Follow installation instructions carefully and verify your device is supported.
        </div>
      </div>

      <!-- FAQ Item 4 -->
      <div class="faq-item border border-white/10 rounded-xl bg-black overflow-hidden">
        <button class="faq-question w-full text-left px-6 py-4 font-bold text-white flex justify-between items-center hover:bg-white/5 transition-colors" onclick="toggleFaq(this)">
          What makes PBRP different from TWRP?
          <i class="fas fa-plus text-pbrp-red transition-transform duration-300"></i>
        </button>
        <div class="faq-answer hidden px-6 py-4 text-gray-400 border-t border-white/5 text-sm leading-relaxed">
          While based on TWRP 3.7.1, PBRP offers a distinctive dark theme, enhanced UI elements, and additional features. We focus on regular updates, device-specific optimizations, and user-friendly interface improvements.
        </div>
      </div>

      <!-- FAQ Item 5 -->
      <div class="faq-item border border-white/10 rounded-xl bg-black overflow-hidden">
        <button class="faq-question w-full text-left px-6 py-4 font-bold text-white flex justify-between items-center hover:bg-white/5 transition-colors" onclick="toggleFaq(this)">
          Can I contribute to PBRP?
          <i class="fas fa-plus text-pbrp-red transition-transform duration-300"></i>
        </button>
        <div class="faq-answer hidden px-6 py-4 text-gray-400 border-t border-white/5 text-sm leading-relaxed">
          Yes! You can contribute by maintaining devices, reporting bugs, or improving our code. Visit our GitHub repository to get started. We welcome contributions from developers around the world.
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Scripts -->
<script>
  // FAQ Toggle Logic
  function toggleFaq(btn) {
    const answer = btn.nextElementSibling;
    const icon = btn.querySelector('.fa-plus');
    
    if (answer.classList.contains('hidden')) {
      answer.classList.remove('hidden');
      icon.style.transform = 'rotate(45deg)';
    } else {
      answer.classList.add('hidden');
      icon.style.transform = 'rotate(0deg)';
    }
  }

  // Device Toggle Logic
  function toggleOem(btn) {
    const list = btn.nextElementSibling;
    const icon = btn.querySelector('.fa-chevron-down');
    
    if (list.classList.contains('hidden')) {
      list.classList.remove('hidden');
      list.classList.add('grid');
      icon.style.transform = 'rotate(180deg)';
    } else {
      list.classList.add('hidden');
      list.classList.remove('grid');
      icon.style.transform = 'rotate(0deg)';
    }
  }

  // Device Filter Logic
  function filterDevices() {
    const query = document.getElementById('device-search').value.toLowerCase();
    const sections = document.querySelectorAll('.oem-section');
    let totalVisible = 0;

    sections.forEach(section => {
      const items = section.querySelectorAll('.device-item');
      let hasMatch = false;
      let sectionTitle = section.querySelector('.oem-toggle span').innerText.toLowerCase();

      // Check if section title matches (e.g. searching "Xiaomi")
      const titleMatch = sectionTitle.includes(query);

      items.forEach(item => {
        const title = item.dataset.title;
        const code = item.dataset.codename;
        
        if (title.includes(query) || code.includes(query) || titleMatch) {
          item.classList.remove('hidden');
          item.classList.add('flex');
          hasMatch = true;
          totalVisible++;
        } else {
          item.classList.add('hidden');
          item.classList.remove('flex');
        }
      });

      if (hasMatch) {
        section.classList.remove('hidden');
        // Auto expand if searching
        if (query.length > 0) {
          const list = section.querySelector('.device-list');
          const icon = section.querySelector('.fa-chevron-down');
          list.classList.remove('hidden');
          list.classList.add('grid');
          icon.style.transform = 'rotate(180deg)';
        }
      } else {
        section.classList.add('hidden');
      }
    });

    const noRes = document.getElementById('no-results');
    if (totalVisible === 0) noRes.classList.remove('hidden');
    else noRes.classList.add('hidden');
  }
</script>
