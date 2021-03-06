<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="heysign-content heysign-content-expired">
    <div class="heysign-content-title">
        ${msg("expired-content-title")}
    </div>
    <div class="heysign-divider"></div>
    <div class="heysign-content-footer margin-bottom-20">
      <div class="heysign-content-footer-left">
        <div class="heysign-link-text heysign-content-ib-vt"
             onclick="goToUrl('${url.loginRestartFlowUrl}')">
          <span>${msg("pageExpiredMsg1")}</span>
        </div>
      </div>
      <div class="heysign-content-footer-right">
        <div class="heysign-link-text heysign-content-ib-vt margin-left-20"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("pageExpiredMsg2")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>