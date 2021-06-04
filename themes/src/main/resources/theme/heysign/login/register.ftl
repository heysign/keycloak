<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <form id="kc-register-form" class="heysign-form" action="${url.registrationAction}"
        method="post">
    <script>

      function onLoadFunction() {
        console.log('onLoadFunction');
        isAgreementRequired(false);
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <div class="heysign-content heysign-content-register">
      <div class="heysign-content-title">
          ${msg("register-content-title")}
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-email")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="email" name="email" type="text"
                 autocomplete="email"
                 value="${(register.formData.email!'')}"
                 maxlength="30"
                 placeholder="${msg("heysign-content-email-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-password")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="password" name="password" type="password" autocomplete="new-password"
                 maxlength="12"
                 placeholder="${msg("heysign-content-password-placeholder")}"
          />
          <input id="password-confirm" name="password-confirm" type="hidden"/>
          <div id="heysign-password-strength-group"
               class="heysign-password-strength heysign-content-hide">
            <div class="heysign-password-strength-text">
              <span>${msg("heysign-password-strength-text")} :</span>
            </div>
            <div class="heysign-password-strength-value">
              <span id="heysign-password-strength-value-span"></span>
            </div>
          </div>
        </div>
        <div class="heysign-flex-br"></div>
        <div class="heysign-content-input-description">
            <span
                class="register-content-label-password-description">${msg("register-content-password-description")}</span>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-name")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="name" name="name" type="text"
                 value="${(register.formData.name!'')}"
                 maxlength="15"
                 placeholder="${msg("heysign-content-name-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-mobile-phone-number")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"
                 autocomplete="mobilePhoneNumber"
                 value="${(register.formData.mobilePhoneNumber!'')}"
                 maxlength="13"
                 placeholder="${msg("heysign-content-mobile-phone-number-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-company")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="company" name="company" type="text"
                 autocomplete="off"
                 maxlength="15"
                 value="${(register.formData.company!'')}"
                 placeholder="${msg("heysign-content-company-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-referral-code")}</span>
        </div>
        <div class="heysign-content-input-text">
            <#if register.formData.referredByCode?? && register.formData.referredByCode?has_content >
              <input id="referredByCode" name="referredByCode1" type="text"
                     disabled class="heysign-content-disabled"
                     value="${(register.formData.referredByCode!'')}"/>
              <input name="referredByCode" type="hidden"
                     value="${(register.formData.referredByCode!'')}"/>
            <#else>
              <input id="referredByCode" name="referredByCode" type="text"
                     autocomplete="off" maxlength="6"
                     value="${(register.formData.referredByCode!'')}"/>
            </#if>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div id="register-agreement-section" class="register-agreement">
        <div class="register-agreement-select">
          <div class="register-agreement-checkbox"
          >
            <div id="all-agreement-checkbox"
                 class="all-agreement-checkbox-checked-svg heysign-content-hide"></div>
          </div>
          <input id="allAgreement" name="allAgreement" type="hidden"/>
          <input id="all-agreement-dropdown" name="allAgreementDropdown" type="hidden"/>
          <div class="register-agreement-text">
            <span>${msg("register-content-all-agreement")}</span>
          </div>
          <div id="div-all-agreement-dropdown" class="all-agreement-dropdown dropdown-default"
               onclick="onAllAgreementDropdownClick()">
          </div>
        </div>
        <div id="register-agreement-option-section"
             class="register-agreement-select-options heysign-content-hide">
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="service-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg heysign-content-hide"></div>
            </div>
            <input id="serviceAgreement" name="serviceAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.heysign.co.kr/service/', 800, 800)">
              <span>${msg("register-content-service-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="privacy-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg heysign-content-hide"></div>
            </div>
            <input id="privacyAgreement" name="privacyAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.heysign.co.kr/privacy/', 800, 800)">
              <span>${msg("register-content-privacy-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="marketing-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg heysign-content-hide"></div>
            </div>
            <input id="marketingAgreement" name="marketingAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.heysign.co.kr/agreement-marketing/', 800, 800)">
              <span>${msg("register-content-marketing-agreement")}</span>
            </div>
          </div>
        </div>
        <div id="register-validation-accept-agreement"
             class="register-validation-agreement heysign-content-hide">
          <span>${msg("heysign-validation-require-accept")}</span>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-footer">
        <div class="heysign-content-footer-left">
          <div class="register-login-text">
            <span>${msg("register-login-msg")}</span>
          </div>
          <div class="register-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("register-login-link")}</span>
          </div>
        </div>
        <div class="heysign-content-footer-right">
          <div id="register-button" class="heysign-button ">
            <span>${msg("register-button")}</span>
          </div>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-login-social-links">
          <#if realm.password && social.providers??>
            <div class="heysign-login-social-link-group">
                <#list social.providers as p>
                    <#if p.alias == "google">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="heysign-flex-br"></div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "kakao">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="heysign-flex-br"></div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "naver">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="heysign-flex-br"></div>
                    </#if>
                </#list>
                <#--              <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                      <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">-->
                <#--                      </div>-->
                <#--                      <div class="heysign-login-social-link-text">-->
                <#--                        <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                      </div>-->
                <#--                    </div>-->
                <#--            <div class="heysign-flex-br"></div>-->
                <#--                  </#if>-->
                <#--              </#list>-->
            </div>
          </#if>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
