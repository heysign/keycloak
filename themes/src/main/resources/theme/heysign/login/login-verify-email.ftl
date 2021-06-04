<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
  <div class="heysign-content heysign-content-verify-email">
    <div class="heysign-content-title">
      <span>${msg("verify-email-content-title")}</span>
    </div>
    <div class="heysign-content-subtitle">
        ${msg("verify-email-content-subtitle", '${email}')?no_esc}
    </div>
      <#--    <div class="heysign-content-email-address">-->
      <#--      <span>${Session["authenticatedUser"]["email"]}</span>-->
      <#--      <span>${account.email}</span>-->
      <#--    </div>-->
    <div class="heysign-divider"></div>
    <div class="heysign-content-footer margin-bottom-20">
      <div class="heysign-content-footer-left">
      </div>
      <div class="heysign-content-footer-right">
        <div id="verify-email-button" class="heysign-button"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("verify-email-link")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>