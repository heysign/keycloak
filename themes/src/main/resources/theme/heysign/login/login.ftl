<#import "template.ftl" as layout>
<@layout.registrationLayout displayWide=(realm.password && social.providers??); section>
  <form id="kc-form-login" class="heysign-form" onsubmit="login.disabled = true; return true;"
        action="${url.loginAction}" method="post">
    <div class="heysign-content heysign-content-login">
      <div class="heysign-content-title">
          ${msg("login-content-title")}
      </div>
      <div class="heysign-login-social-links">
          <#if realm.password && social.providers??>
            <div class="heysign-login-social-link-group">
                <#list social.providers as p>
                    <#if p.alias == "google">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">
                        <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "kakao">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">
                        <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "naver">
                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">
                        <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="heysign-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                    </#if>
                </#list>
<#--                <#list social.providers as p>-->
<#--                    <#if p.alias == "facebook">-->
<#--                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
<#--                        <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">-->
<#--                        </div>-->
<#--                        <div class="heysign-login-social-link-text">-->
<#--                          <span>${msg("login-social-${p.alias}")}</span>-->
<#--                        </div>-->
<#--                      </div>-->
<#--                    </#if>-->
<#--                </#list>-->
            </div>
          </#if>
      </div>
      <div class="heysign-content-or">
        <div class="heysign-content-or-divider">
        </div>
        <div class="heysign-content-or-text">
          <span>or</span>
        </div>
        <div class="heysign-content-or-divider">
        </div>
      </div>
      <div class="heysign-content-input-group margin-top-30">
        <div class="heysign-content-input-label">
          <span>${msg("login-content-label-email")}</span>
        </div>
        <div class="heysign-content-input-text">
            <#if usernameEditDisabled??>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" disabled
                     maxlength="100"
              placeholder="${msg("heysign-content-email-placeholder")}" />
            <#else>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" autofocus
                     maxlength="100"
                     autocomplete="off" placeholder="${msg("heysign-content-email-placeholder")}" />
            </#if>
        </div>
      </div>
      <div class="heysign-content-input-group margin-top-20">
        <div class="heysign-content-input-label">
          <span>${msg("login-content-label-password")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                 maxlength="12"
                 placeholder="${msg("heysign-content-password-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-button" onclick="clickSubmit('kc-form-login')">
        <span>${msg("login-button")}</span>
      </div>
      <div class="heysign-content-hr">
      </div>
      <div class="heysign-login-forgot-id heysign-link-text"
           onclick="goToUrl('${url.loginFindEmailUrl}')">
        <span>${msg("login-content-forgot-id")}</span>
      </div>
      <div class="heysign-login-register" onclick="goToUrl('${url.registrationUrl}')">
        <span>${msg("login-register-link")}</span>
      </div>
      <br/>
      <div class="heysign-login-forgot-password heysign-link-text"
           onclick="goToUrl('${url.loginResetCredentialsUrl}')">
        <span>${msg("login-content-forgot-password")}</span>
      </div>
    </div>
  </form>
</@layout.registrationLayout>