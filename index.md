---
layout: default
title: "PitchBlack Recovery Project"
---

<!-- Hero Section -->
<section class="hero-section" id="home">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto text-center hero-content">
        <h1 class="hero-title font-orbitron gradient-text">PitchBlack Recovery Project</h1>
        <p class="hero-subtitle">The Perfect Android Recovery for your device! PBRP provides the most advanced Open Source Android Recovery to troubleshoot your device on the GO!</p>
        <div class="d-flex flex-column flex-md-row gap-3 justify-content-center">
          <a href="#devices" class="btn btn-gradient btn-lg px-4">
            <i class="fas fa-download me-2"></i>Download Now
          </a>
          <a href="#donate" class="btn btn-outline-gradient btn-lg px-4">
            <i class="fas fa-heart me-2"></i>Donate
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- About Section -->
<section id="about" class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title text-center font-orbitron gradient-text">About PBRP</h2>
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <p class="lead text-center mb-5">PitchBlack Recovery Project is an Open Source organization founded on 28th March 2018 by developers from different countries with an aim to provide the world's most advanced recovery with better customization's, themes and features.</p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row g-4">
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-tools feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Advanced Toolbox</h3>
          <p class="text-muted">PBRP provides 10+ tools that come in handy when working with your device, including Magisk Manager integration.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-mobile-alt feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Wide Device Support</h3>
          <p class="text-muted">Supports a wide range of devices with Treble, ARB Support, Force Encryption and much more.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-paint-brush feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Theme Support</h3>
          <p class="text-muted">Coming Soon: Customize PBRP according to your needs using PBRP Theme Engine™.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-layer-group feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Material Design UI</h3>
          <p class="text-muted">Best in class material design interface for the latest Android experience.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-sync feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Latest TWRP Base</h3>
          <p class="text-muted">Based on TWRP 3.7.1 with support for both modern and legacy devices.</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="card h-100 text-center p-4">
          <i class="fas fa-language feature-icon gradient-text"></i>
          <h3 class="h5 mb-3">Multi-Language Support</h3>
          <p class="text-muted">Official support for 10+ languages that are updated and improved regularly!</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Requirements Section -->
<section id="requirements" class="py-5 bg-dark">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2 class="section-title text-center font-orbitron gradient-text">Installation Requirements</h2>
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <ul class="list-unstyled mb-0">
                  <li class="d-flex align-items-center mb-3">
                    <i class="fas fa-unlock-alt text-primary me-3"></i>
                    <span>Unlocked bootloader (device-specific process)</span>
                  </li>
                  <li class="d-flex align-items-center mb-3">
                    <i class="fas fa-bug text-primary me-3"></i>
                    <span>USB debugging enabled</span>
                  </li>
                  <li class="d-flex align-items-center mb-3">
                    <i class="fas fa-terminal text-primary me-3"></i>
                    <span>ADB and Fastboot tools installed on your computer</span>
                  </li>
                  <li class="d-flex align-items-center mb-3">
                    <i class="fas fa-usb text-primary me-3"></i>
                    <span>Proper USB drivers for your device</span>
                  </li>
                  <li class="d-flex align-items-center">
                    <i class="fas fa-save text-primary me-3"></i>
                    <span>A complete backup of your important data</span>
                  </li>
                </ul>
              </div>
            </div>
            <div class="warning mt-4">
              <p class="mb-0"><strong>Warning:</strong> Installing a custom recovery may void your warranty and requires careful attention to instructions. Always follow device-specific guides.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Devices Section -->
<section id="devices" class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title text-center font-orbitron gradient-text">Supported Devices</h2>
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="position-relative mb-4">
              <input type="text" id="device-search" class="form-control form-control-lg" placeholder="Search devices..." onkeyup="filterDevices()">
              <i class="fas fa-search position-absolute top-50 end-0 translate-middle-y me-3 text-muted"></i>
            </div>

            {% assign oem_groups = site.oem | group_by:"oem" %}
            <ul class="list-unstyled oem-list" id="device-list">
              {% for group in oem_groups %}
              <li class="mb-3">
                <button class="btn oem-toggle w-100 d-flex justify-content-between align-items-center" aria-expanded="false" aria-controls="devices-{{ group.name | slugify }}">
                  <span class="fw-semibold">{{ group.name | capitalize }}</span>
                  <i class="fas fa-chevron-down"></i>
                </button>
                <div class="device-list mt-2" id="devices-{{ group.name | slugify }}" style="display: none;">
                  {% for device in group.items %}
                  <div class="device-item" data-title="{{ device.title | downcase }}" data-codename="{{ device.codename | downcase }}">
                    <a href="{{ device.url | relative_url }}" class="text-decoration-none">{{ device.title }}</a>
                  </div>
                  {% endfor %}
                </div>
              </li>
              {% endfor %}
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Community Section -->
<section id="community" class="py-5 bg-dark">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title text-center font-orbitron gradient-text">Join Our Community</h2>
        <div class="row g-4">
          <div class="col-md-6">
            <a href="https://t.me/pbrpcom" class="community-card text-decoration-none" target="_blank" rel="noopener noreferrer">
              <div class="card h-100 text-center p-4">
                <i class="fab fa-telegram feature-icon gradient-text"></i>
                <h3 class="h5 mb-3">Telegram</h3>
                <p class="text-muted">Join our active Telegram community for support and updates</p>
              </div>
            </a>
          </div>
          <div class="col-md-6">
            <a href="https://github.com/PitchBlackRecoveryProject" class="community-card text-decoration-none" target="_blank" rel="noopener noreferrer">
              <div class="card h-100 text-center p-4">
                <i class="fab fa-github feature-icon gradient-text"></i>
                <h3 class="h5 mb-3">GitHub</h3>
                <p class="text-muted">Contribute to development and report issues</p>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Donation Section -->
<section id="donate" class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <div class="donation-section text-center">
          <h2 class="section-title font-orbitron gradient-text">Support PBRP</h2>
          <h3 class="h4 mb-4 gradient-text">YOUR DONATION MATTERS A LOT TO US!</h3>
          <p class="lead mb-4">We are a group of people giving our valuable time to this self-less service only for YOU, that's why it's only YOU who can help us.</p>
          <p class="mb-4">We need your Support to keep PBRP alive!</p>
          <div class="d-flex flex-column flex-md-row gap-3 justify-content-center">
            <a href="https://www.patreon.com/pitchblackrecovery" class="btn btn-gradient btn-lg px-4" target="_blank" rel="noopener noreferrer">
              <i class="fab fa-patreon me-2"></i>Support on Patreon
            </a>
            <a href="https://opencollective.com/pitchblackrecovery" class="btn btn-outline-gradient btn-lg px-4" target="_blank" rel="noopener noreferrer">
              <i class="fas fa-hand-holding-heart me-2"></i>Support on Open Collective
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- FAQ Section -->
<section id="faq" class="py-5 bg-dark">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2 class="section-title text-center font-orbitron gradient-text">Frequently Asked Questions</h2>
        
        <div class="faq-item">
          <button class="faq-question" aria-expanded="false">What is PBRP?</button>
          <div class="faq-answer" style="display: none;">
            PitchBlack Recovery Project is a feature-rich custom recovery, based on TWRP 3.7.0, designed to offer a unique black-themed interface and improved functionality. It provides tools for backup, restore, and system modification operations.
          </div>
        </div>
        
        <div class="faq-item">
          <button class="faq-question" aria-expanded="false">How do I install PBRP?</button>
          <div class="faq-answer" style="display: none;">
            Installation methods vary by device. Common methods include fastboot, Odin (Samsung devices), or SP Flash Tool (MediaTek devices). Always follow the device-specific installation guide available on your device's download page.
          </div>
        </div>
        
        <div class="faq-item">
          <button class="faq-question" aria-expanded="false">Is PBRP safe to use?</button>
          <div class="faq-answer" style="display: none;">
            Yes, PBRP is safe when used correctly. We recommend always creating a backup before making system modifications. Follow installation instructions carefully and verify your device is supported.
          </div>
        </div>
        
        <div class="faq-item">
          <button class="faq-question" aria-expanded="false">What makes PBRP different from TWRP?</button>
          <div class="faq-answer" style="display: none;">
            While based on TWRP 3.7.0, PBRP offers a distinctive dark theme, enhanced UI elements, and additional features. We focus on regular updates, device-specific optimizations, and user-friendly interface improvements.
          </div>
        </div>
        
        <div class="faq-item">
          <button class="faq-question" aria-expanded="false">Can I contribute to PBRP?</button>
          <div class="faq-answer" style="display: none;">
            Yes! You can contribute by maintaining devices, reporting bugs, or improving our code. Visit our GitHub repository to get started. We welcome contributions from developers around the world.
          </div>
        </div>
      </div>
    </div>
  </div>
</section>