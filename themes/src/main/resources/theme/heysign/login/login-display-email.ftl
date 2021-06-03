<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <div class="heysign-content heysign-content-display-email">
    <div class="heysign-content-title">
        ${msg("display-email-content-title")?no_esc}
    </div>
    <div class="heysign-content-subtitle">
        <#if email?? >
            ${email}
        <#else>
            ${msg("id-not-found")}
        </#if>
    </div>
    <div class="heysign-divider"></div>
    <div class="heysign-content-footer margin-bottom-20">
      <div class="heysign-link-text " onclick="goToUrl('${url.loginUrl}')">
        <span>${msg("heysign-go-back-to-login-link")}</span>
      </div>
        <#if email?? >
          <div id="resetPassword" class="heysign-button margin-left-140"
               onclick="goToUrl('${url.loginResetCredentialsUrl}')">
            <span>${msg("reset-password-button")}</span>
          </div>
        </#if>
      </div>
    </div>
  </div>
</@layout.registrationLayout>