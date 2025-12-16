---
layout: default
title: "Official Device Maintainer - PitchBlack Recovery Project"
permalink: /official/
---

<div class="max-w-3xl mx-auto py-10 px-4">
  
  <div class="text-center mb-10">
    <h1 class="text-3xl md:text-4xl font-display font-bold text-white mb-2">Maintainer Application</h1>
    <p class="text-gray-400">Join the official roster and bring PitchBlack to your device.</p>
  </div>

  <!-- Form Container -->
  <div class="bg-zinc-900 border border-white/10 rounded-2xl overflow-hidden shadow-2xl relative">
    
    <!-- Progress Header -->
    <div class="bg-black/30 p-6 border-b border-white/5">
      <div class="flex justify-between items-center relative max-w-sm mx-auto">
        <div class="absolute top-1/2 left-0 w-full h-0.5 bg-zinc-800 -z-0"></div>
        <div class="relative z-10 flex flex-col items-center step-indicator active" data-step="1">
          <div class="w-10 h-10 rounded-full bg-pbrp-red text-white flex items-center justify-center font-bold text-sm shadow-lg transition-all ring-4 ring-zinc-900">1</div>
          <span class="text-xs text-white mt-2 font-medium">Personal</span>
        </div>
        <div class="relative z-10 flex flex-col items-center step-indicator opacity-50" data-step="2">
          <div class="w-10 h-10 rounded-full bg-zinc-800 text-gray-400 border border-zinc-700 flex items-center justify-center font-bold text-sm transition-all ring-4 ring-zinc-900">2</div>
          <span class="text-xs text-gray-500 mt-2 font-medium">Device</span>
        </div>
        <div class="relative z-10 flex flex-col items-center step-indicator opacity-50" data-step="3">
          <div class="w-10 h-10 rounded-full bg-zinc-800 text-gray-400 border border-zinc-700 flex items-center justify-center font-bold text-sm transition-all ring-4 ring-zinc-900">3</div>
          <span class="text-xs text-gray-500 mt-2 font-medium">Submit</span>
        </div>
      </div>
    </div>

    <!-- Form Content -->
    <form id="maintainerForm" class="p-6 md:p-8" onsubmit="event.preventDefault();">
      
      <!-- STEP 1: Personal Details -->
      <div class="form-step block" id="step-1">
        <h3 class="text-lg font-bold text-white mb-6 border-l-4 border-pbrp-red pl-3">Personal Details</h3>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Full Name <span class="text-red-500">*</span></label>
            <input type="text" id="fullName" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none focus:ring-1 focus:ring-pbrp-red transition-all placeholder-gray-700" placeholder="John Doe" required>
          </div>
          
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Email <span class="text-red-500">*</span></label>
            <input type="email" id="email" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none focus:ring-1 focus:ring-pbrp-red transition-all placeholder-gray-700" placeholder="name@example.com" required>
          </div>
          
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">GitHub Username <span class="text-red-500">*</span></label>
            <div class="flex">
              <span class="inline-flex items-center px-3 rounded-l-lg border border-r-0 border-white/10 bg-white/5 text-gray-400">@</span>
              <input type="text" id="githubUsername" class="w-full bg-black/50 border border-white/10 rounded-r-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none focus:ring-1 focus:ring-pbrp-red transition-all" placeholder="username" required>
            </div>
          </div>
          
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Telegram ID</label>
            <div class="flex">
              <span class="inline-flex items-center px-3 rounded-l-lg border border-r-0 border-white/10 bg-white/5 text-gray-400">@</span>
              <input type="text" id="telegramId" class="w-full bg-black/50 border border-white/10 rounded-r-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none focus:ring-1 focus:ring-pbrp-red transition-all" placeholder="username">
            </div>
          </div>

          <div class="md:col-span-2 space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Preferred Communication <span class="text-red-500">*</span></label>
            <select id="communication" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all appearance-none cursor-pointer">
              <option value="Telegram">Telegram</option>
              <option value="GitHub">GitHub</option>
              <option value="Email">Email</option>
            </select>
          </div>
        </div>

        <div class="mt-8 flex justify-end">
          <button type="button" onclick="nextStep()" class="px-8 py-3 rounded-lg bg-pbrp-red text-white font-bold hover:bg-red-600 transition-colors shadow-lg shadow-red-900/20 flex items-center gap-2">
            Next <i class="fas fa-arrow-right"></i>
          </button>
        </div>
      </div>

      <!-- STEP 2: Device Details -->
      <div class="form-step hidden" id="step-2">
        <h3 class="text-lg font-bold text-white mb-6 border-l-4 border-pbrp-red pl-3">Device & Build Info</h3>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Device Vendor <span class="text-red-500">*</span></label>
            <input type="text" id="deviceVendor" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. Xiaomi" required>
          </div>

          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Device Name <span class="text-red-500">*</span></label>
            <input type="text" id="deviceName" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. Redmi Note 10" required>
          </div>
          
          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Codename <span class="text-red-500">*</span></label>
            <input type="text" id="deviceCodename" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. mojito" required>
          </div>

          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Android Version <span class="text-red-500">*</span></label>
            <input type="text" id="androidVersion" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. Android 13" required>
          </div>

          <!-- Build Info -->
          <div class="md:col-span-2 space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">UNOFFICIAL Build Link <span class="text-red-500">*</span></label>
            <input type="url" id="unofficialBuildLink" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="https://..." required>
          </div>

          <div class="md:col-span-2 space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Forum/Support Link</label>
            <input type="url" id="forumLink" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="https://t.me/..." required>
          </div>

          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Testing Users <span class="text-red-500">*</span></label>
            <input type="text" id="testingUsers" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. 50+" required>
          </div>

          <div class="space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Build Status <span class="text-red-500">*</span></label>
            <input type="text" id="buildStatus" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="e.g. Stable" required>
          </div>
          
          <div class="md:col-span-2 space-y-1">
            <label class="block text-xs text-gray-500 uppercase font-bold">Device Tree URL <span class="text-red-500">*</span></label>
            <input type="url" id="deviceTreeUrl" class="w-full bg-black/50 border border-white/10 rounded-lg px-4 py-3 text-white focus:border-pbrp-red focus:outline-none transition-all" placeholder="https://github.com/..." required>
          </div>
        </div>

        <div class="mt-8 flex justify-between">
          <button type="button" onclick="prevStep()" class="px-6 py-3 rounded-lg border border-white/10 text-gray-300 hover:text-white hover:bg-white/5 transition-colors font-medium">Back</button>
          <button type="button" onclick="nextStep()" class="px-8 py-3 rounded-lg bg-pbrp-red text-white font-bold hover:bg-red-600 transition-colors shadow-lg shadow-red-900/20 flex items-center gap-2">
            Next <i class="fas fa-arrow-right"></i>
          </button>
        </div>
      </div>

      <!-- STEP 3: Confirm & Submit -->
      <div class="form-step hidden" id="step-3">
        <h3 class="text-lg font-bold text-white mb-6 border-l-4 border-pbrp-red pl-3">Confirmation</h3>
        
        <div class="bg-yellow-500/10 border border-yellow-500/20 rounded-xl p-5 mb-8">
          <h4 class="text-yellow-500 font-bold mb-3 flex items-center gap-2">
            <i class="fas fa-exclamation-triangle"></i> Requirements Check
          </h4>
          <ul class="text-sm text-yellow-100/80 list-disc pl-5 space-y-2">
            <li>I confirm my unofficial build is stable and bug-free.</li>
            <li>I commit to providing monthly updates for this device.</li>
            <li>I will actively support users in the Telegram community.</li>
          </ul>
        </div>

        <div class="mb-8">
          <label class="flex items-center gap-4 p-4 rounded-xl border border-white/10 bg-black/20 hover:bg-white/5 cursor-pointer transition-colors group">
            <div class="relative flex items-center">
              <input type="checkbox" id="agreeRules" class="peer h-5 w-5 cursor-pointer appearance-none rounded-md border border-gray-500 bg-zinc-900 transition-all checked:border-pbrp-red checked:bg-pbrp-red" required>
              <i class="fas fa-check absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 text-xs text-white opacity-0 peer-checked:opacity-100 pointer-events-none"></i>
            </div>
            <span class="text-sm text-gray-300 group-hover:text-white transition-colors">I agree to the requirements above.</span>
          </label>
        </div>

        <div class="flex flex-col sm:flex-row justify-between items-center gap-4">
          <button type="button" onclick="prevStep()" class="w-full sm:w-auto px-6 py-3 rounded-lg border border-white/10 text-gray-300 hover:text-white hover:bg-white/5 transition-colors font-medium">Back</button>
          
          <div class="flex flex-col sm:flex-row gap-3 w-full sm:w-auto">
            <button type="button" id="submitTelegram" class="flex-1 sm:flex-none px-6 py-3 rounded-lg bg-blue-600 hover:bg-blue-500 text-white font-bold transition-colors shadow-lg shadow-blue-900/20 flex items-center justify-center gap-2">
              <i class="fab fa-telegram"></i> Copy & Open Telegram
            </button>
            <button type="button" id="submitGitHub" class="flex-1 sm:flex-none px-6 py-3 rounded-lg bg-zinc-800 border border-white/10 hover:bg-zinc-700 text-white font-bold transition-colors flex items-center justify-center gap-2">
              <i class="fab fa-github"></i> Create Issue
            </button>
          </div>
        </div>
      </div>

    </form>
  </div>
</div>

<script>
  let currentStep = 1;
  const totalSteps = 3;

  function showStep(step) {
    document.querySelectorAll('.form-step').forEach(el => {
        el.classList.add('hidden');
        el.classList.remove('block');
    });
    
    const current = document.getElementById(`step-${step}`);
    if(current) {
        current.classList.remove('hidden');
        current.classList.add('block');
    }
    
    document.querySelectorAll('.step-indicator').forEach((el, index) => {
      const circle = el.querySelector('div');
      const stepNum = index + 1;
      const label = el.querySelector('span');
      
      el.classList.remove('active', 'opacity-50');
      circle.classList.remove('bg-pbrp-red', 'bg-green-500', 'bg-zinc-800', 'text-gray-400');
      
      if (stepNum === step) {
        el.classList.add('active');
        circle.classList.add('bg-pbrp-red', 'text-white', 'shadow-lg');
        label.classList.add('text-white');
        label.classList.remove('text-gray-500');
      } else if (stepNum < step) {
        circle.classList.add('bg-green-500', 'text-white');
        circle.innerHTML = '<i class="fas fa-check"></i>';
        label.classList.remove('text-white');
        label.classList.add('text-gray-500');
      } else {
        el.classList.add('opacity-50');
        circle.classList.add('bg-zinc-800', 'text-gray-400', 'border', 'border-zinc-700');
        circle.innerText = stepNum;
        label.classList.remove('text-white');
        label.classList.add('text-gray-500');
      }
    });
  }

  function validateStep(step) {
    const el = document.getElementById(`step-${step}`);
    const inputs = el.querySelectorAll('input[required], select[required]');
    let valid = true;
    
    inputs.forEach(input => {
      if (!input.value.trim() || (input.type === 'checkbox' && !input.checked)) {
        input.classList.add('border-red-500', 'ring-1', 'ring-red-500');
        valid = false;
      } else {
        input.classList.remove('border-red-500', 'ring-1', 'ring-red-500');
        input.classList.add('border-green-500/50');
      }
    });
    return valid;
  }

  window.nextStep = () => {
    if (validateStep(currentStep)) {
      if (currentStep < totalSteps) {
        currentStep++;
        showStep(currentStep);
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }
    } else {
        alert("Please fill in all required fields.");
    }
  };

  window.prevStep = () => {
    if (currentStep > 1) {
      currentStep--;
      showStep(currentStep);
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  };

  // Generate the formatted text block
  function generateApplicationText() {
    const name = document.getElementById('fullName').value;
    const email = document.getElementById('email').value;
    const github = document.getElementById('githubUsername').value;
    const telegram = document.getElementById('telegramId').value;
    const comm = document.getElementById('communication').value;
    
    const device = document.getElementById('deviceName').value;
    const codename = document.getElementById('deviceCodename').value;
    const vendor = document.getElementById('deviceVendor').value;
    const android = document.getElementById('androidVersion').value;
    
    const buildLink = document.getElementById('unofficialBuildLink').value;
    const forumLink = document.getElementById('forumLink').value;
    const users = document.getElementById('testingUsers').value;
    const status = document.getElementById('buildStatus').value;
    const tree = document.getElementById('deviceTreeUrl').value;

    return `PBRP Official Maintainer Application

Personal Information:
- Name: ${name}
- Email: ${email}
- GitHub Username: @${github}
- Telegram ID: ${telegram ? '@' + telegram : 'N/A'}
- Preferred Communication: ${comm}

Device Information:
- Device Name: ${device}
- Device Codename: ${codename}
- Vendor/OEM: ${vendor}
- Target Android Version: ${android}

Build Information:
- UNOFFICIAL Build Link: ${buildLink}
- Forum Link: ${forumLink}
- Testing Users: ${users}
- Build Status: ${status}
- Device Tree URL: ${tree}`;
  }

  document.getElementById('submitTelegram').onclick = () => {
    if(validateStep(3)) {
      const text = generateApplicationText();
      navigator.clipboard.writeText(text).then(() => {
          alert("Application text copied! Redirecting to Telegram...");
          window.open('https://t.me/pbrpcom', '_blank');
      }).catch(err => {
          console.error(err);
          alert("Copy failed. Please manually copy the text.");
      });
    } else {
        alert("Please accept the requirements.");
    }
  };

  document.getElementById('submitGitHub').onclick = () => {
    if(validateStep(3)) {
      const device = document.getElementById('deviceName').value;
      const codename = document.getElementById('deviceCodename').value;
      const github = document.getElementById('githubUsername').value;
      const telegram = document.getElementById('telegramId').value;
      
      // Construct exact Title requested
      let title = `[MAINTAINER APPLICATION] ${device} (${codename})`;
      
      const body = encodeURIComponent(generateApplicationText());
      window.open(`https://github.com/PitchBlackRecoveryProject/vendor_utils/issues/new?title=${encodeURIComponent(title)}&body=${body}`, '_blank');
    } else {
        alert("Please accept the requirements.");
    }
  };

  document.querySelectorAll('input').forEach(input => {
      input.addEventListener('input', function() {
          if(this.value.trim()) {
              this.classList.remove('border-red-500', 'ring-1', 'ring-red-500');
          }
      });
  });

  showStep(1);
</script>
