<#import "template.ftl" as layout>
<@layout.registrationLayout displayWide=(realm.password && social.providers??); section>
  <form id="kc-form-login" class="heysign-form" onsubmit="login.disabled = true; return true;"
        action="${url.loginAction}" method="post">
    <div class="heysign-content heysign-content-login">
      <div class="heysign-content-title">
          ${msg("login-content-title")}
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("login-content-label-email")}</span>
        </div>
        <div class="heysign-content-input-text">
            <#if usernameEditDisabled??>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" disabled
                     maxlength="100"
                     placeholder="${msg("heysign-content-email-placeholder")}"/>
            <#else>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" autofocus
                     maxlength="100"
                     autocomplete="off" placeholder="${msg("heysign-content-email-placeholder")}"/>
            </#if>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("login-content-label-password")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                 maxlength="12"
                 placeholder="${msg("heysign-content-password-placeholder")}"/>
        </div>
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-footer">
        <div class="heysign-content-footer-left">
          <div class="heysign-login-forgot-id heysign-link-text"
               onclick="goToUrl('${url.loginFindEmailUrl}')">
            <span>${msg("login-content-forgot-id")}</span>
          </div>
          <div class="heysign-login-forgot-password heysign-link-text margin-left-20"
               onclick="goToUrl('${url.loginResetCredentialsUrl}')">
            <span>${msg("login-content-forgot-password")}</span>
          </div>
          <div class="heysign-login-register heysign-link-text margin-left-20"
               onclick="goToUrl('${url.registrationUrl}')">
            <span>${msg("login-register-link")}</span>
          </div>
        </div>
        <div class="heysign-content-footer-right">
          <div class="heysign-button" onclick="clickSubmit('kc-form-login')">
            <span>${msg("login-button")}</span>
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
                <#--                <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="heysign-login-social-link heysign-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                        <div class="heysign-login-social-link-img heysign-login-social-link-${p.alias}-svg">-->
                <#--                        </div>-->
                <#--                        <div class="heysign-login-social-link-text">-->
                <#--                          <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                        </div>-->
                <#--                      </div>-->
                <#--              <div class="heysign-flex-br"></div>-->
                <#--                    </#if>-->
                <#--                </#list>-->
            </div>
          </#if>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
