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
    <div id="resetPassword" class="heysign-button-white"
         onclick="goToUrl('${url.loginResetCredentialsUrl}')">
      <span>${msg("reset-password-button")}</span>
    </div>
      <div id="login" class="heysign-button"
           onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("login-button")}</span>
      </div>
  </div>
</@layout.registrationLayout>