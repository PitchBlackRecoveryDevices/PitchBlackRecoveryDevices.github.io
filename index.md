---
layout: default
title: "PitchBlack Recovery Project"
---

<section class="hero" id="home" role="banner" aria-label="PitchBlack Recovery Project banner">
  <h1>PitchBlack Recovery Project</h1>
  <p>The custom recovery for your device — fast, reliable, and with a sleek dark theme.</p>
</section>

<section id="about" aria-labelledby="about-title">
  <h2 id="about-title">About PBRP</h2>
  <p>The PitchBlack Recovery Project (PBRP) is a custom recovery image based on the popular TWRP, designed with custom theming and features for maximum usability. It allows you to install custom ROMs, mods, create backups, and manage your device safely and efficiently.</p>
</section>

<section id="devices" aria-labelledby="devices-title">
  <h2 id="devices-title">Supported Devices</h2>

  <input type="text" id="device-search" placeholder="Search devices..." aria-label="Search devices" onkeyup="filterDevices()">

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

<section id="faq" aria-labelledby="faq-title">
  <h2 id="faq-title">Frequently Asked Questions</h2>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">What is PBRP?</div>
    <div class="faq-answer" hidden>
      PitchBlack Recovery Project is a feature-rich custom recovery, forked from TWRP, designed to offer a unique black-themed interface and improved functionality.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">How do I install PBRP?</div>
    <div class="faq-answer" hidden>
      Installation instructions depend on your device. Generally, you flash the recovery image using fastboot or Odin. Be sure to follow device-specific guides carefully.
    </div>
  </div>
  <div class="faq-item">
    <div class="faq-question" tabindex="0" role="button" aria-expanded="false">Is PBRP safe to use?</div>
    <div class="faq-answer" hidden>
      Yes, using PBRP is safe if you follow installation instructions correctly. It includes features to backup and restore your data before making changes.
    </div>
  </div>
</section>
