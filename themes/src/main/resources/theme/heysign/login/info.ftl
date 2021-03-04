<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="heysign-content heysign-content-info">
    <div class="heysign-content-title">
        ${msg("login-content-title")}
    </div>
    <div class="heysign-content-subtitle heysign-info-text">
        ${message.summary}
    </div>
    <div class="heysign-content-footer">
        <#if pageRedirectUri??>
          <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${pageRedirectUri}')">
            <span>${msg("heysign-go-back-to-application-link")}</span>
          </div>
        <#elseif actionUri??>
          <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${actionUri}')">
            <span>${msg("heysign-proceed-with-action")}</span>
          </div>
        <#elseif client.baseUrl??>
          <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("heysign-go-back-to-application-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>