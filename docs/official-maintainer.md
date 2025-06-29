---
layout: default
title: "Official Device Maintainer - PitchBlack Recovery Project"
permalink: /official/
---

<!-- Official Device Maintainer Documentation -->
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <h1 class="page-heading gradient-text font-orbitron">Official Device Maintainer</h1>
        
        <div class="card mb-4">
          <div class="card-body">
            <p class="lead">Become an official PBRP device maintainer and join our team of dedicated developers providing quality recovery builds to the Android community.</p>
          </div>
        </div>

        <!-- Multi-Step Application Form -->
        <div class="card mb-4" id="application-form">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">
              <i class="fas fa-file-alt me-2"></i>Maintainer Application Form
            </h2>
          </div>
          <div class="card-body">
            <!-- Progress Steps -->
            <div class="row mb-4">
              <div class="col-12">
                <div class="d-flex justify-content-between align-items-center position-relative">
                  <div class="progress-line"></div>
                  <div class="step-indicator active" data-step="1">
                    <div class="step-circle">1</div>
                    <div class="step-label">General Details</div>
                  </div>
                  <div class="step-indicator" data-step="2">
                    <div class="step-circle">2</div>
                    <div class="step-label">Device Details</div>
                  </div>
                  <div class="step-indicator" data-step="3">
                    <div class="step-circle">3</div>
                    <div class="step-label">Personal Details</div>
                  </div>
                </div>
              </div>
            </div>

            <form id="maintainerForm" class="needs-validation" novalidate>
              <!-- Step 1: General Details -->
              <div class="form-step active" id="step-1">
                <h4 class="gradient-text mb-4">Step 1: General Details</h4>
                
                <div class="row g-3">
                  <div class="col-md-6">
                    <label for="fullName" class="form-label">Name *</label>
                    <input type="text" class="form-control" id="fullName" placeholder="Your full name" required>
                    <div class="invalid-feedback">Please provide your full name.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="email" class="form-label">Email *</label>
                    <input type="email" class="form-control" id="email" placeholder="your.email@example.com" required>
                    <div class="invalid-feedback">Please provide a valid email address.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="deviceName" class="form-label">Device Name *</label>
                    <input type="text" class="form-control" id="deviceName" placeholder="e.g., Xiaomi POCO X3 NFC" required>
                    <div class="invalid-feedback">Please provide the device name.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="deviceCodename" class="form-label">Device Codename *</label>
                    <input type="text" class="form-control" id="deviceCodename" placeholder="e.g., surya" required>
                    <div class="invalid-feedback">Please provide the device codename.</div>
                  </div>
                </div>
                
                <!-- FIXED: Consistent button layout for step 1 -->
                <div class="mt-4">
                  <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-gradient" onclick="nextStep()">
                      Next <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                  </div>
                </div>
              </div>

              <!-- Step 2: Device Details -->
              <div class="form-step" id="step-2">
                <h4 class="gradient-text mb-4">Step 2: Device Details</h4>
                
                <div class="row g-3">
                  <div class="col-md-6">
                    <label for="deviceVendor" class="form-label">Device Vendor/OEM *</label>
                    <input type="text" class="form-control" id="deviceVendor" placeholder="e.g., xiaomi, samsung, oneplus" required>
                    <div class="invalid-feedback">Please provide the device vendor.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="androidVersion" class="form-label">Target Android Version *</label>
                    <input type="text" class="form-control" id="androidVersion" placeholder="e.g., Android 14, Android 13" required>
                    <div class="invalid-feedback">Please provide the Android version.</div>
                  </div>
                  
                  <div class="col-12">
                    <label for="unofficialBuildLink" class="form-label">UNOFFICIAL Build Link *</label>
                    <input type="url" class="form-control" id="unofficialBuildLink" placeholder="https://example.com/your-unofficial-build" required>
                    <div class="form-text">Link to your current UNOFFICIAL PBRP build</div>
                    <div class="invalid-feedback">Please provide a valid build link.</div>
                  </div>
                  
                  <div class="col-12">
                    <label for="forumLink" class="form-label">Forum Link *</label>
                    <input type="url" class="form-control" id="forumLink" placeholder="https://forum.xda-developers.com/t/..." required>
                    <div class="form-text">Forum link where you published your UNOFFICIAL Build</div>
                    <div class="invalid-feedback">Please provide a valid forum link.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="testingUsers" class="form-label">Estimated Number of Users *</label>
                    <input type="number" class="form-control" id="testingUsers" min="50" placeholder="50+" required>
                    <div class="form-text">Estimate number of users who are using this UNOFFICIAL build</div>
                    <div class="invalid-feedback">Minimum 50 testing users required.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="buildStatus" class="form-label">Current Build Status *</label>
                    <input type="text" class="form-control" id="buildStatus" placeholder="e.g., Fully Working, Minor Issues" required>
                    <div class="invalid-feedback">Please describe the build status.</div>
                  </div>
                  
                  <div class="col-12">
                    <label for="deviceTreeUrl" class="form-label">Device Tree Link *</label>
                    <input type="url" class="form-control" id="deviceTreeUrl" placeholder="https://github.com/username/android_device_vendor_codename" required>
                    <div class="form-text">Device tree link of the current build</div>
                    <div class="invalid-feedback">Please provide a valid device tree URL.</div>
                  </div>
                </div>
                
                <!-- FIXED: Better button layout for step 2 -->
                <div class="mt-4">
                  <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                    <button type="button" class="btn btn-outline-secondary" onclick="prevStep()">
                      <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    <button type="button" class="btn btn-gradient" onclick="nextStep()">
                      Next <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                  </div>
                </div>
              </div>

              <!-- Step 3: Personal Details -->
              <div class="form-step" id="step-3">
                <h4 class="gradient-text mb-4">Step 3: Personal Details</h4>
                
                <div class="row g-3">
                  <div class="col-md-6">
                    <label for="githubUsername" class="form-label">GitHub Username *</label>
                    <div class="input-group">
                      <span class="input-group-text">@</span>
                      <input type="text" class="form-control" id="githubUsername" placeholder="yourusername" required>
                      <div class="invalid-feedback">Please provide your GitHub username.</div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="telegramId" class="form-label">Telegram ID</label>
                    <div class="input-group">
                      <span class="input-group-text">@</span>
                      <input type="text" class="form-control" id="telegramId" placeholder="yourusername">
                    </div>
                    <div class="form-text">Optional but recommended for communication</div>
                  </div>
                  
                  <div class="col-12">
                    <label for="communicationMethod" class="form-label">Preferred Communication Method *</label>
                    <input type="text" class="form-control" id="communicationMethod" placeholder="e.g., Telegram, Email, GitHub, Discord" required>
                    <div class="invalid-feedback">Please specify your preferred communication method.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="androidExperience" class="form-label">Android Development Experience *</label>
                    <input type="text" class="form-control" id="androidExperience" placeholder="e.g., 2 years, Beginner, Advanced" required>
                    <div class="invalid-feedback">Please describe your experience level.</div>
                  </div>
                  
                  <div class="col-md-6">
                    <label for="previousMaintainer" class="form-label">Previous Maintainer Experience</label>
                    <input type="text" class="form-control" id="previousMaintainer" placeholder="e.g., Yes for PBRP, Yes for other projects, No">
                  </div>
                  
                  <div class="col-12">
                    <label for="commitment" class="form-label">Why do you want to become an official maintainer? *</label>
                    <textarea class="form-control" id="commitment" rows="4" placeholder="Explain your motivation and commitment to maintaining this device..." required></textarea>
                    <div class="invalid-feedback">Please provide your motivation statement.</div>
                  </div>
                  
                  <div class="col-12">
                    <label for="additionalInfo" class="form-label">Additional Information</label>
                    <textarea class="form-control" id="additionalInfo" rows="3" placeholder="Any additional information you'd like to share (optional)..."></textarea>
                  </div>
                  
                  <!-- Agreements -->
                  <div class="col-12 mt-4">
                    <div class="card bg-dark border-warning">
                      <div class="card-body">
                        <h6 class="text-warning mb-3">
                          <i class="fas fa-exclamation-triangle me-2"></i>Maintainer Agreements
                        </h6>
                        <div class="form-check mb-2">
                          <input class="form-check-input" type="checkbox" id="agreeRules" required>
                          <label class="form-check-label" for="agreeRules">
                            I agree to follow all PBRP maintainer rules and responsibilities *
                          </label>
                          <div class="invalid-feedback">You must agree to the rules.</div>
                        </div>
                        
                        <div class="form-check mb-2">
                          <input class="form-check-input" type="checkbox" id="agreeMonthly" required>
                          <label class="form-check-label" for="agreeMonthly">
                            I commit to providing monthly builds and community support *
                          </label>
                          <div class="invalid-feedback">You must commit to monthly builds.</div>
                        </div>
                        
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="agreeQuality" required>
                          <label class="form-check-label" for="agreeQuality">
                            I understand that my device must have 50+ testing users and be bug-free *
                          </label>
                          <div class="invalid-feedback">You must acknowledge the quality requirements.</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- FIXED: Better button layout with proper spacing -->
                <div class="mt-4">
                  <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                    <button type="button" class="btn btn-outline-secondary" onclick="prevStep()">
                      <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    
                    <div class="d-flex flex-column flex-sm-row gap-2">
                      <button type="button" class="btn btn-gradient" id="submitTelegram">
                        <i class="fab fa-telegram me-2"></i>Submit via Telegram
                      </button>
                      <button type="button" class="btn btn-outline-gradient" id="submitGitHub">
                        <i class="fab fa-github me-2"></i>Create GitHub Issue
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <!-- Benefits Section -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Perks of Being an Official Device Maintainer</h2>
          </div>
          <div class="card-body">
            <div class="row g-4">
              <div class="col-md-6">
                <div class="d-flex align-items-start">
                  <div class="flex-shrink-0">
                    <i class="fas fa-robot text-primary fs-4 me-3"></i>
                  </div>
                  <div>
                    <h5 class="mb-2">Automated CI Builds</h5>
                    <p class="text-muted mb-0">PBRP builds and deploys automatically. You don't need any personal server infrastructure.</p>
                  </div>
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="d-flex align-items-start">
                  <div class="flex-shrink-0">
                    <i class="fas fa-flask text-primary fs-4 me-3"></i>
                  </div>
                  <div>
                    <h5 class="mb-2">Next Version Testing</h5>
                    <p class="text-muted mb-0">Get early access to test new PBRP versions before they're released to the public.</p>
                  </div>
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="d-flex align-items-start">
                  <div class="flex-shrink-0">
                    <i class="fas fa-shield-alt text-primary fs-4 me-3"></i>
                  </div>
                  <div>
                    <h5 class="mb-2">PBRP Trusted Builds</h5>
                    <p class="text-muted mb-0">Official PBRP builds give users confidence and trust in the quality of your work.</p>
                  </div>
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="d-flex align-items-start">
                  <div class="flex-shrink-0">
                    <i class="fas fa-users text-primary fs-4 me-3"></i>
                  </div>
                  <div>
                    <h5 class="mb-2">Community Recognition</h5>
                    <p class="text-muted mb-0">Join our official team and get recognized in the Android development community.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Requirements Section -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Requirements & Rules</h2>
          </div>
          <div class="card-body">
            <p class="mb-4">PBRP Device Maintainers must strictly follow these rules and regulations:</p>
            
            <div class="row g-4">
              <div class="col-12">
                <div class="card bg-dark border-warning">
                  <div class="card-body">
                    <h5 class="text-warning mb-3">
                      <i class="fas fa-exclamation-triangle me-2"></i>Critical Requirements
                    </h5>
                    <ul class="mb-0">
                      <li class="mb-2"><strong>Bug-Free Unofficial Build:</strong> Your unofficial build must have no critical bugs and should be tested by at least 50 users before applying.</li>
                      <li class="mb-2"><strong>Android Version:</strong> Device target version must be Android 7.1 (Nougat) or higher.</li>
                      <li class="mb-2"><strong>Device Tree Maintenance:</strong> Device trees must be properly and regularly maintained with clean commits.</li>
                      <li class="mb-2"><strong>Monthly Releases:</strong> Maintainers must be active to release monthly builds consistently.</li>
                      <li class="mb-0"><strong>Bug Responsibility:</strong> Any bugs reported on official builds will result in warnings and potential suspension of maintainership.</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <div class="mt-4">
              <h5 class="mb-3">Additional Guidelines</h5>
              <ul class="list-unstyled">
                <li class="d-flex align-items-start mb-3">
                  <i class="fas fa-code text-primary me-3 mt-1"></i>
                  <div>
                    <strong>Code Quality:</strong> Follow PBRP coding standards and maintain clean, well-documented device trees.
                  </div>
                </li>
                <li class="d-flex align-items-start mb-3">
                  <i class="fas fa-comments text-primary me-3 mt-1"></i>
                  <div>
                    <strong>Community Support:</strong> Actively respond to user issues and provide support in community channels.
                  </div>
                </li>
                <li class="d-flex align-items-start mb-3">
                  <i class="fas fa-sync-alt text-primary me-3 mt-1"></i>
                  <div>
                    <strong>Source Updates:</strong> Keep your device tree updated with the latest PBRP source changes.
                  </div>
                </li>
                <li class="d-flex align-items-start">
                  <i class="fas fa-handshake text-primary me-3 mt-1"></i>
                  <div>
                    <strong>Team Collaboration:</strong> Work collaboratively with other maintainers and PBRP team members.
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <!-- Manual Application Process -->
        <div class="card mb-4">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Manual Application Process</h2>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-8">
                <h5 class="mb-3">Alternative: Manual GitHub Application</h5>
                <p class="mb-4">If you prefer to apply manually, you can submit a pull request to our vendor utilities repository.</p>
                
                <div class="steps">
                  <div class="d-flex align-items-start mb-4">
                    <div class="flex-shrink-0">
                      <span class="badge bg-primary rounded-circle p-2 me-3">1</span>
                    </div>
                    <div>
                      <h6 class="mb-2">Prepare Your Device</h6>
                      <p class="text-muted mb-0">Ensure your device meets all requirements and has been thoroughly tested by the community.</p>
                    </div>
                  </div>
                  
                  <div class="d-flex align-items-start mb-4">
                    <div class="flex-shrink-0">
                      <span class="badge bg-primary rounded-circle p-2 me-3">2</span>
                    </div>
                    <div>
                      <h6 class="mb-2">Fork the Repository</h6>
                      <p class="text-muted mb-0">Fork the <code>vendor_utils</code> repository to your GitHub account.</p>
                    </div>
                  </div>
                  
                  <div class="d-flex align-items-start mb-4">
                    <div class="flex-shrink-0">
                      <span class="badge bg-primary rounded-circle p-2 me-3">3</span>
                    </div>
                    <div>
                      <h6 class="mb-2">Edit pb_devices.json</h6>
                      <p class="text-muted mb-0">Add your device information to the <code>pb_devices.json</code> file following the required format.</p>
                    </div>
                  </div>
                  
                  <div class="d-flex align-items-start mb-4">
                    <div class="flex-shrink-0">
                      <span class="badge bg-primary rounded-circle p-2 me-3">4</span>
                    </div>
                    <div>
                      <h6 class="mb-2">Submit Pull Request</h6>
                      <p class="text-muted mb-0">Create a pull request with your changes and wait for review by the PBRP team.</p>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="col-md-4">
                <div class="card bg-dark">
                  <div class="card-body text-center">
                    <i class="fab fa-github fs-1 text-primary mb-3"></i>
                    <h5 class="mb-3">Manual Application</h5>
                    <p class="text-muted mb-4">Submit via GitHub pull request</p>
                    <a href="https://github.com/PitchBlackRecoveryProject/vendor_utils/blob/pb/pb_devices.json" class="btn btn-gradient" target="_blank" rel="noopener noreferrer">
                      <i class="fab fa-github me-2"></i>View Repository
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Contact Information -->
        <div class="card">
          <div class="card-header">
            <h2 class="h4 mb-0 gradient-text">Need Help?</h2>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-8">
                <p class="mb-3">If you have questions about becoming an official maintainer or need assistance with the application process, don't hesitate to reach out to our community.</p>
                
                <div class="d-flex flex-column flex-md-row gap-3">
                  <a href="https://t.me/pbrpcom" class="btn btn-outline-gradient" target="_blank" rel="noopener noreferrer">
                    <i class="fab fa-telegram me-2"></i>Join Telegram
                  </a>
                  <a href="https://github.com/PitchBlackRecoveryProject" class="btn btn-outline-gradient" target="_blank" rel="noopener noreferrer">
                    <i class="fab fa-github me-2"></i>Visit GitHub
                  </a>
                </div>
              </div>
              
              <div class="col-md-4 text-center">
                <i class="fas fa-question-circle fs-1 text-primary mb-3"></i>
                <p class="text-muted">Our team is here to help you succeed as a maintainer!</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
/* Multi-step form styles */
.progress-line {
  position: absolute;
  top: 20px;
  left: 0;
  right: 0;
  height: 2px;
  background: var(--bs-border-color);
  z-index: 1;
}

.step-indicator {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  z-index: 2;
  background: var(--bs-body-bg);
  padding: 0 15px;
}

.step-circle {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--bs-border-color);
  color: var(--text-muted);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  margin-bottom: 8px;
  transition: all 0.3s ease;
}

.step-indicator.active .step-circle {
  background: var(--primary-gradient);
  color: white;
}

.step-indicator.completed .step-circle {
  background: var(--success-color);
  color: white;
}

.step-label {
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--text-muted);
  text-align: center;
  white-space: nowrap;
}

.step-indicator.active .step-label {
  color: var(--bs-primary);
}

.step-indicator.completed .step-label {
  color: var(--success-color);
}

.form-step {
  display: none;
  animation: fadeInUp 0.5s ease-out;
}

.form-step.active {
  display: block;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* FIXED: Better button spacing and layout for all steps */
.form-step .mt-4 .d-flex {
  min-height: 60px; /* Ensure consistent height */
}

.form-step .btn {
  white-space: nowrap; /* Prevent text wrapping */
  min-width: 140px; /* Minimum button width */
  padding: 0.75rem 1.5rem; /* Consistent padding */
}

/* FIXED: Ensure proper spacing between buttons */
.form-step .d-flex.gap-3 {
  gap: 1rem !important;
}

.form-step .d-flex.gap-2 {
  gap: 0.75rem !important;
}

/* Mobile responsive adjustments */
@media (max-width: 768px) {
  .step-label {
    font-size: 0.75rem;
  }
  
  .step-circle {
    width: 35px;
    height: 35px;
    font-size: 0.875rem;
  }
  
  .step-indicator {
    padding: 0 10px;
  }
  
  /* FIXED: Stack buttons vertically on mobile */
  .form-step .d-flex.flex-column.flex-sm-row {
    width: 100%;
    flex-direction: column !important;
  }
  
  .form-step .btn {
    min-width: auto;
    width: 100%;
    margin-bottom: 0.5rem;
  }
  
  /* FIXED: Better spacing for navigation buttons */
  .form-step .d-flex.justify-content-between {
    flex-direction: column;
    gap: 1rem;
    align-items: stretch;
  }
}

@media (max-width: 576px) {
  .step-label {
    display: none;
  }
  
  .step-indicator {
    padding: 0 5px;
  }
  
  /* FIXED: Better mobile button layout */
  .form-step .d-flex.justify-content-between {
    flex-direction: column;
    gap: 1rem;
    align-items: stretch;
  }
  
  .form-step .d-flex.flex-column.flex-sm-row {
    order: 1;
    width: 100%;
  }
  
  .form-step .btn-outline-secondary {
    order: 2;
    width: 100%;
  }
  
  /* FIXED: Ensure all buttons are full width on small screens */
  .form-step .btn {
    width: 100% !important;
    min-width: auto !important;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  let currentStep = 1;
  const totalSteps = 3;
  
  const form = document.getElementById('maintainerForm');
  const submitTelegramBtn = document.getElementById('submitTelegram');
  const submitGitHubBtn = document.getElementById('submitGitHub');

  // Step navigation functions
  window.nextStep = function() {
    if (validateCurrentStep()) {
      if (currentStep < totalSteps) {
        currentStep++;
        showStep(currentStep);
      }
    }
  };

  window.prevStep = function() {
    if (currentStep > 1) {
      currentStep--;
      showStep(currentStep);
    }
  };

  function showStep(step) {
    // Hide all steps
    document.querySelectorAll('.form-step').forEach(s => s.classList.remove('active'));
    document.querySelectorAll('.step-indicator').forEach(s => {
      s.classList.remove('active', 'completed');
    });

    // Show current step
    document.getElementById(`step-${step}`).classList.add('active');
    
    // Update step indicators
    for (let i = 1; i <= totalSteps; i++) {
      const indicator = document.querySelector(`[data-step="${i}"]`);
      if (i < step) {
        indicator.classList.add('completed');
      } else if (i === step) {
        indicator.classList.add('active');
      }
    }
  }

  function validateCurrentStep() {
    const currentStepElement = document.getElementById(`step-${currentStep}`);
    const requiredFields = currentStepElement.querySelectorAll('[required]');
    let isValid = true;

    requiredFields.forEach(field => {
      if (field.type === 'checkbox') {
        if (!field.checked) {
          field.classList.add('is-invalid');
          isValid = false;
        } else {
          field.classList.remove('is-invalid');
          field.classList.add('is-valid');
        }
      } else {
        if (!field.value.trim()) {
          field.classList.add('is-invalid');
          isValid = false;
        } else {
          field.classList.remove('is-invalid');
          field.classList.add('is-valid');
        }
      }
    });

    // Special validation for testing users
    if (currentStep === 2) {
      const testingUsers = document.getElementById('testingUsers');
      if (testingUsers.value && parseInt(testingUsers.value) < 50) {
        testingUsers.classList.add('is-invalid');
        isValid = false;
      }
    }

    if (!isValid) {
      // Scroll to first invalid field
      const firstInvalid = currentStepElement.querySelector('.is-invalid');
      if (firstInvalid) {
        firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
      }
    }

    return isValid;
  }

  function validateAllSteps() {
    let allValid = true;
    for (let i = 1; i <= totalSteps; i++) {
      const stepElement = document.getElementById(`step-${i}`);
      const requiredFields = stepElement.querySelectorAll('[required]');
      
      requiredFields.forEach(field => {
        if (field.type === 'checkbox') {
          if (!field.checked) {
            allValid = false;
          }
        } else {
          if (!field.value.trim()) {
            allValid = false;
          }
        }
      });
    }
    return allValid;
  }

  // Generate application text
  function generateApplicationText() {
    const fullName = document.getElementById('fullName').value;
    const email = document.getElementById('email').value;
    const deviceName = document.getElementById('deviceName').value;
    const deviceCodename = document.getElementById('deviceCodename').value;
    const deviceVendor = document.getElementById('deviceVendor').value;
    const androidVersion = document.getElementById('androidVersion').value;
    const unofficialBuildLink = document.getElementById('unofficialBuildLink').value;
    const forumLink = document.getElementById('forumLink').value;
    const testingUsers = document.getElementById('testingUsers').value;
    const buildStatus = document.getElementById('buildStatus').value;
    const deviceTreeUrl = document.getElementById('deviceTreeUrl').value;
    const githubUsername = document.getElementById('githubUsername').value;
    const telegramId = document.getElementById('telegramId').value;
    const communicationMethod = document.getElementById('communicationMethod').value;
    const androidExperience = document.getElementById('androidExperience').value;
    const previousMaintainer = document.getElementById('previousMaintainer').value;
    const commitment = document.getElementById('commitment').value;
    const additionalInfo = document.getElementById('additionalInfo').value;

    return `PBRP Official Maintainer Application

Personal Information:
- Name: ${fullName}
- Email: ${email}
- GitHub Username: @${githubUsername}
- Telegram ID: ${telegramId ? '@' + telegramId : 'Not provided'}
- Preferred Communication: ${communicationMethod}

Device Information:
- Device Name: ${deviceName}
- Device Codename: ${deviceCodename}
- Vendor/OEM: ${deviceVendor}
- Target Android Version: ${androidVersion}

Build Information:
- UNOFFICIAL Build Link: ${unofficialBuildLink}
- Forum Link: ${forumLink}
- Testing Users: ${testingUsers}+ users
- Build Status: ${buildStatus}
- Device Tree URL: ${deviceTreeUrl}

Experience & Commitment:
- Android Development Experience: ${androidExperience}
- Previous Maintainer Experience: ${previousMaintainer || 'None'}

Why do you want to become an official maintainer?
${commitment}

${additionalInfo ? `Additional Information:\n${additionalInfo}` : ''}

Agreements:
✅ I agree to follow all PBRP maintainer rules and responsibilities
✅ I commit to providing monthly builds and community support
✅ I understand that my device must have 50+ testing users and be bug-free

Application submitted via PBRP website form`;
  }

  // Submit via Telegram
  submitTelegramBtn.addEventListener('click', function() {
    if (!validateAllSteps()) {
      alert('Please fill in all required fields correctly in all steps.');
      return;
    }

    const applicationText = generateApplicationText();
    // Use window.open with proper URL encoding for Telegram
    const telegramUrl = `https://t.me/pbrpcom`;
    
    // Copy text to clipboard and open Telegram
    navigator.clipboard.writeText(applicationText).then(function() {
      alert('Application text copied to clipboard! Please paste it in the Telegram group.');
      window.open(telegramUrl, '_blank');
    }).catch(function() {
      // Fallback if clipboard API fails
      const textArea = document.createElement('textarea');
      textArea.value = applicationText;
      document.body.appendChild(textArea);
      textArea.select();
      document.execCommand('copy');
      document.body.removeChild(textArea);
      alert('Application text copied to clipboard! Please paste it in the Telegram group.');
      window.open(telegramUrl, '_blank');
    });
  });

  // Submit via GitHub Issue
  submitGitHubBtn.addEventListener('click', function() {
    if (!validateAllSteps()) {
      alert('Please fill in all required fields correctly in all steps.');
      return;
    }

    const applicationText = generateApplicationText();
    const deviceCodename = document.getElementById('deviceCodename').value;
    const deviceName = document.getElementById('deviceName').value;
    const githubUsername = document.getElementById('githubUsername').value;
    
    const issueTitle = `[MAINTAINER APPLICATION] ${deviceName} (${deviceCodename}) - @${githubUsername}`;
    const issueBody = applicationText;
    
    const githubUrl = `https://github.com/PitchBlackRecoveryProject/vendor_utils/issues/new?title=${encodeURIComponent(issueTitle)}&body=${encodeURIComponent(issueBody)}&labels=maintainer-application`;
    
    window.open(githubUrl, '_blank');
  });

  // Real-time validation
  form.addEventListener('input', function(e) {
    if (e.target.hasAttribute('required')) {
      if (e.target.type === 'checkbox') {
        if (e.target.checked) {
          e.target.classList.remove('is-invalid');
          e.target.classList.add('is-valid');
        }
      } else {
        if (e.target.value.trim()) {
          e.target.classList.remove('is-invalid');
          e.target.classList.add('is-valid');
        } else {
          e.target.classList.remove('is-valid');
          e.target.classList.add('is-invalid');
        }
      }
    }
  });

  // Initialize first step
  showStep(1);
});
</script>