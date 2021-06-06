<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
        method="post">
    <script>

      function onLoadFunction() {
        console.log('onLoadFunction');
        isAgreementRequired(false);
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <input id="password" name="password" type="hidden" value="1111QWwwe!">
    <input name="email" type="hidden" value="${(user.email!'')}">
    <input name="naverIdRequired" type="hidden" value="${(naverIdRequired!'')}">
    <div class="heysign-content heysign-content-register">
      <div class="heysign-content-title">
          ${msg("login-update-profile-content-title")}
      </div>
      <div class="heysign-content-subtitle">
          ${msg("login-update-profile-content-subtitle", "${(socialName!'')}")}
          <#if naverIdRequired == "true">
            <br/><br/>${msg("heysign-content-naver-description", "${(user.email!'')}")?no_esc}
          </#if>
      </div>
      <div class="heysign-divider"></div>
        <#if naverIdRequired == "false">
          <div class="heysign-content-input-group ">
            <div class="heysign-content-input-label margin-left-20">
              <span>${msg("register-content-email")}</span>
            </div>
            <div class="heysign-content-input-text heysign-content-disabled">
              <input id="email" name="email1" type="text" disabled
                     value="${(user.email!'')}"/>
            </div>
          </div>
        </#if>
        <#if naverIdRequired == "true">
          <div class="heysign-content-input-group ">
            <div class="heysign-content-input-label margin-left-20">
              <span>${msg("register-content-naver-id")}</span>
            </div>
            <div class="heysign-content-input-text">
              <input id="email" name="email1" type="hidden" value=""/>
              <input id="naverId" name="naverId" type="text"
                     value="${(naverId!user.naverId!'')}"
                     maxlength="50"
                     placeholder="${msg("heysign-content-naver-id-placeholder")}"/>
            </div>
          </div>
        </#if>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-name")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="name" name="name" type="text"
                 value="${(name!user.name!'')}"
                 maxlength="50"
                 placeholder="${msg("heysign-content-name-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-mobile-phone-number")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"
                 autocomplete="mobilePhoneNumber"
                 maxlength="20"
                 value="${(mobilePhoneNumber!user.mobilePhoneNumber!'')}"
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
                 autocomplete="company"
                 maxlength="100"
                 value="${(company!user.company!'')}"
                 placeholder="${msg("heysign-content-company-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group ">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("register-content-referral-code")}</span>
        </div>
        <div class="heysign-content-input-text">
            <#if referredByCode?? && referredByCode?has_content >
              <input id="referredByCode" name="referredByCode1" type="text"
                     disabled class="heysign-content-disabled"
                     value="${(referredByCode!'')}"/>
              <input name="referredByCode" type="hidden"
                     value="${(referredByCode!'')}"/>
            <#else>
              <input id="referredByCode" name="referredByCode" type="text"
                     autocomplete="off" maxlength="6"
                     value="${(referredByCode!'')}"/>
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
               onclick="onAllAgreementDropdownClick(event)">
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
                 onclick="openNewWindows('https://www.heysign.co.kr/policy/service.html', 800, 800)">
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
                 onclick="openNewWindows('https://www.heysign.co.kr/policy/privacy.html', 800, 800)">
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
                 onclick="openNewWindows('https://www.heysign.co.kr/policy/marketing.html', 800, 800)">
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
      <div class="heysign-content-footer margin-bottom-20">
        <div class="heysign-content-footer-left">
          <div class="register-login-text">
            <span>${msg("register-login-msg")}</span>
          </div>
          <div class="register-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("register-login-link")}</span>
          </div>
        </div>
        <div class="heysign-content-footer-right">
          <div id="register-button" class="heysign-button">
            <span>${msg("register-button")}</span>
          </div>
        </div>
      </div>
    </div>
      <#--      <#if user.editUsernameAllowed>-->
      <#--        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">-->
      <#--          <div class="${properties.kcLabelWrapperClass!}">-->
      <#--            <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>-->
      <#--          </div>-->
      <#--          <div class="${properties.kcInputWrapperClass!}">-->
      <#--            <input type="text" id="username" name="username" value="${(user.username!'')}"-->
      <#--                   class="${properties.kcInputClass!}"/>-->
      <#--          </div>-->
      <#--        </div>-->
      <#--      </#if>-->
      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}"-->
      <#--               class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}"-->
      <#--               class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!}">-->
      <#--      <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">-->
      <#--        <div class="${properties.kcFormOptionsWrapperClass!}">-->
      <#--        </div>-->
      <#--      </div>-->

      <#--      <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">-->
      <#--          <#if isAppInitiatedAction??>-->
      <#--            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"-->
      <#--                   type="submit" value="${msg("doSubmit")}"/>-->
      <#--            <button-->
      <#--            class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"-->
      <#--            type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>-->
      <#--          <#else>-->
      <#--            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"-->
      <#--                   type="submit" value="${msg("doSubmit")}"/>-->
      <#--          </#if>-->
      <#--      </div>-->
      <#--    </div>-->
  </form>
</@layout.registrationLayout>
