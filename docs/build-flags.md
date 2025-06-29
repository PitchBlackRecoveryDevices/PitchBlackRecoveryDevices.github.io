---
layout: default
title: "Build Flags - PitchBlack Recovery Project"
permalink: /docs/build-flags/
---

<!-- Build Flags Documentation -->
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <h1 class="page-heading gradient-text font-orbitron">Build Flags</h1>
        
        <div class="card mb-4">
          <div class="card-body">
            <p class="lead">This section provides custom PBRP Build Flags that can be used while building for devices. These flags are expected to be used inside <code>BoardConfig.mk</code> of your device tree.</p>
          </div>
        </div>

        <!-- PBRP GO Support -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">PBRP GO Support <span class="text-muted">(DEPRECATED in 3.0.0)</span></h2>
          </div>
          <div class="card-body">
            <p>PBRP GO is a lite version of the real PBRP for devices like MTK which have limited recovery partition size. The recovery built will only support limited themes.</p>
            
            <div class="warning">
              <strong>Note:</strong> This feature has been deprecated in PBRP 3.0.0 and later versions.
            </div>
            
            <h5 class="mt-4 mb-3">Usage:</h5>
            <code>PB_GO := TRUE</code>
          </div>
        </div>

        <!-- Disable dm-verity -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Disable dm-verity by Default</h2>
          </div>
          <div class="card-body">
            <p>dm-verity is enabled by default in PBRP. This build flag disables dm-verity by default, which can be useful for devices that have issues with dm-verity verification.</p>
            
            <h5 class="mt-4 mb-3">Usage:</h5>
            <code>PB_DISABLE_DEFAULT_DM_VERITY := true</code>
            
            <div class="mt-3">
              <p><strong>When to use:</strong> Use this flag when your device has dm-verity issues that prevent proper booting after system modifications.</p>
            </div>
          </div>
        </div>

        <!-- Force DD Flash -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Force Use of dd for Flashing Recovery</h2>
          </div>
          <div class="card-body">
            <p>There are many old devices (like mt65xx variants) which follow traditional approach to flash recovery which can cause issues while flashing. This is an <strong>EXPERIMENTAL</strong> flag, enable only if you are facing the same kind of issue.</p>
            
            <div class="warning">
              <strong>Warning:</strong> This is an experimental flag. Only enable if you're experiencing flashing issues with traditional methods.
            </div>
            
            <h5 class="mt-4 mb-3">Usage:</h5>
            <code>PB_FORCE_DD_FLASH := TRUE</code>
            
            <div class="mt-3">
              <p><strong>When to use:</strong> Use this flag for older MediaTek devices (mt65xx variants) that have issues with standard recovery flashing methods.</p>
            </div>
          </div>
        </div>

        <!-- Official/Beta Build -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Official and Beta Build Flags</h2>
          </div>
          <div class="card-body">
            <p>These flags are used to mark builds as official or beta releases, which affects the build identification and branding.</p>
            
            <h5 class="mt-4 mb-3">Usage:</h5>
            <div class="row">
              <div class="col-md-6">
                <h6>Official Build:</h6>
                <code>PB_OFFICIAL := true</code>
              </div>
              <div class="col-md-6">
                <h6>Beta Build:</h6>
                <code>BETA_BUILD := true</code>
              </div>
            </div>
            
            <div class="mt-3">
              <p><strong>Note:</strong> Use <code>PB_OFFICIAL := true</code> for official releases and <code>BETA_BUILD := true</code> for beta builds.</p>
            </div>
          </div>
        </div>

        <!-- Specific Torch Path -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Specific Torch Path</h2>
          </div>
          <div class="card-body">
            <p>For devices that require a specific torch/flashlight path in PBRP, use this flag to define the correct system path.</p>
            
            <h5 class="mt-4 mb-3">Usage:</h5>
            <code>PB_TORCH_PATH := /sys/class/leds/flashlight</code>
            
            <div class="mt-3">
              <p><strong>Example paths:</strong></p>
              <ul>
                <li><code>/sys/class/leds/flashlight</code> - Common flashlight path</li>
                <li><code>/sys/class/leds/torch-light0</code> - Alternative torch path</li>
                <li><code>/sys/class/leds/led:flash_0</code> - Another common path</li>
              </ul>
              
              <p><strong>When to use:</strong> Use this flag when the default torch implementation doesn't work on your device, and you need to specify a custom path for the flashlight functionality.</p>
            </div>
          </div>
        </div>

        <!-- Additional Information -->
        <div class="card">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Additional Information</h2>
          </div>
          <div class="card-body">
            <h5>Implementation Guidelines:</h5>
            <ul>
              <li>Add these flags to your device's <code>BoardConfig.mk</code> file</li>
              <li>Flags should be placed before any conditional statements that might depend on them</li>
              <li>Test thoroughly when using experimental flags</li>
              <li>Document any custom flags used in your device tree README</li>
            </ul>
            
            <h5 class="mt-4">Example BoardConfig.mk snippet:</h5>
            <pre><code># PBRP Build Flags
PB_OFFICIAL := true
PB_DISABLE_DEFAULT_DM_VERITY := true
PB_TORCH_PATH := /sys/class/leds/flashlight

# Other device configurations...
TARGET_ARCH := arm64</code></pre>
            
            <div class="mt-4">
              <p><strong>Need Help?</strong> If you're unsure about which flags to use for your device, consult with the PBRP community on <a href="https://t.me/pbrpcom" target="_blank" rel="noopener noreferrer">Telegram</a> or check existing device trees on <a href="https://github.com/PitchBlackRecoveryProject" target="_blank" rel="noopener noreferrer">GitHub</a>.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
