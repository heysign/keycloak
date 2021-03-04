<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="heysign-content heysign-content-error">
    <div class="heysign-content-title">
        ${msg("login-content-title")}
    </div>
    <div class="heysign-content-subtitle heysign-error-text">
        ${message.summary?no_esc}
    </div>
    <div class="heysign-content-footer">
        <#if client?? && client.baseUrl?has_content>
          <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("heysign-go-back-to-application-link")}</span>
          </div>
        <#else>
          <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("heysign-go-back-to-login-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>