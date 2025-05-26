---
layout: default
title: "PitchBlack Recovery Project"
---

<section class="hero" id="home" role="banner" aria-label="PitchBlack Recovery Project banner">
  <h1>PitchBlack Recovery Project</h1>
  <p>The Perfect Android Recovery for your device! PBRP provides the most advanced Open Source Android Recovery to troubleshoot your device on the GO!</p>
  <div class="hero-buttons">
    <a href="#devices" class="btn primary">Download Now</a>
    <a href="#donate" class="btn secondary" rel="noopener noreferrer">Donate</a>
  </div>
</section>

<section id="about" aria-labelledby="about-title">
  <h2 id="about-title">About PBRP</h2>
  <p>PitchBlack Recovery Project is an Open Source organization founded on 28th March 2018 by developers from different countries with an aim to provide the world's most advanced recovery with better customization's, themes and features.</p>
  
  <div class="feature-grid">
    <div class="feature-item">
      <i class="fas fa-tools"></i>
      <h3>Advanced Toolbox</h3>
      <p>PBRP provides 10+ tools that come in handy when working with your device, including Magisk Manager integration.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-mobile-alt"></i>
      <h3>Wide Device Support</h3>
      <p>Supports a wide range of devices with Treble, ARB Support, Force Encryption and much more.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-paint-brush"></i>
      <h3>Theme Support</h3>
      <p>Coming Soon: Customize PBRP according to your needs using PBRP Theme Engine™.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-layer-group"></i>
      <h3>Material Design UI</h3>
      <p>Best in class material design interface for the latest Android experience.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-sync"></i>
      <h3>Latest TWRP Base</h3>
      <p>Based on TWRP 3.7.0 with support for both modern and legacy devices.</p>
    </div>
    <div class="feature-item">
      <i class="fas fa-language"></i>
      <h3>Multi-Language Support</h3>
      <p>Official support for 10+ languages that are updated and improved regularly!</p>
    </div>
  </div>
</section>

<section id="requirements" aria-labelledby="requirements-title">
  <h2 id="requirements-title">Installation Requirements</h2>
  <ul class="requirements-list">
    <li>Unlocked bootloader (device-specific process)</li>
    <li>USB debugging enabled</li>
    <li>ADB and Fastboot tools installed on your computer</li>
    <li>Proper USB drivers for your device</li>
    <li>A complete backup of your important data</li>
  </ul>
  <div class="warning-box">
    <p><strong>Warning:</strong> Installing a custom recovery may void your warranty and requires careful attention to instructions. Always follow device-specific guides.</p>
  </div>
</section>

<section id="devices" aria-labelledby="devices-title">
  <h2 id="devices-title">Supported Devices</h2>
  <div class="search-container">
    <input type="text" id="device-search" placeholder="Search devices..." aria-label="Search devices" onkeyup="filterDevices()">
    <i class="fas fa-search search-icon"></i>
  </div>

  {% assign oem_groups = site.oem | group_by:"oem" %}
  <ul class="oem-list" id="device-list">
    {% for group in oem_groups %}
    <li>
      <button class="oem-toggle" aria-expanded="false" aria-controls="devices-{{ group.name | slugify }}">
        {{ group.name | capitalize }}
      </button>
      <ul class="device-list" id="devices-{{ group.name | slugify }}" hidden>
        {% for device in group.items %}
        <li class="device-item" data-title="{{ device.title | downcase }}" data-codename="{{ device.codename | downcase }}">
          <a href="{{ device.url | relative_url }}">{{ device.title }}</a>
        </li>
        {% endfor %}
      </ul>
    </li>
    {% endfor %}
  </ul>
</section>

<section id="community" aria-labelledby="community-title">
  <h2 id="community-title">Join Our Community</h2>
  <div class="community-grid">
    <a href="https://t.me/pbrpcom" class="community-item" target="_blank" rel="noopener noreferrer">
      <i class="fab fa-telegram"></i>
      <h3>Telegram</h3>
      <p>Join our active Telegram community for support and updates</p>
    </a>
    <a href="https://github.com/PitchBlackRecoveryProject" class="community-item" target="_blank" rel="noopener noreferrer">
      <i class="fab fa-github"></i>
      <h3>GitHub</h3>
      <p>Contribute to development and report issues</p>
    </a>
  </div>
</section>

<section id="donate" aria-labelledby="donate-title">
  <h2 id="donate-title">Support PBRP</h2>
  <div class="donation-content">
    <div class="donation-text">
      <h3>YOUR DONATION MATTERS A LOT TO US!</h3>
      <p>We are a group of people giving our valuable time to this self-less service only for YOU, that's why it's only YOU who can help us.</p>
      <p>We need your Support to keep PBRP alive!</p>
    </div>
    <div class="donation-methods">
      <a href="https://www.patreon.com/pitchblackrecovery" class="btn primary" target="_blank" rel="noopener noreferrer">
        <i class="fab fa-patreon"></i> Support on Patreon
      </a>
      <a href="https://opencollective.com/pitchblackrecovery" class="btn secondary" target="_blank" rel="noopener noreferrer">
        <i class="fas fa-hand-holding-heart"></i> Support on Open Collective
      </a>
    </div>
  </div>
</section>

<section id="faq" aria-labelledby="faq-title">
  <h2 id="faq-title">Frequently Asked Questions</h2>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">What is PBRP?</div>
    <div class="faq-answer" hidden>
      PitchBlack Recovery Project is a feature-rich custom recovery, based on TWRP 3.7.0, designed to offer a unique black-themed interface and improved functionality. It provides tools for backup, restore, and system modification operations.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">How do I install PBRP?</div>
    <div class="faq-answer" hidden>
      Installation methods vary by device. Common methods include fastboot, Odin (Samsung devices), or SP Flash Tool (MediaTek devices). Always follow the device-specific installation guide available on your device's download page.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">Is PBRP safe to use?</div>
    <div class="faq-answer" hidden>
      Yes, PBRP is safe when used correctly. We recommend always creating a backup before making system modifications. Follow installation instructions carefully and verify your device is supported.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">What makes PBRP different from TWRP?</div>
    <div class="faq-answer" hidden>
      While based on TWRP 3.7.0, PBRP offers a distinctive dark theme, enhanced UI elements, and additional features. We focus on regular updates, device-specific optimizations, and user-friendly interface improvements.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">Can I contribute to PBRP?</div>
    <div class="faq-answer" hidden>
      Yes! You can contribute by maintaining devices, reporting bugs, or improving our code. Visit our GitHub repository to get started. We welcome contributions from developers around the world.
    </div>
  </div>
</section>
