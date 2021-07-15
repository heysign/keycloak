<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
    <script>
      function onLoadFunction() {
        console.log('onLoadFunction');
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <input type="text" id="username" name="username" value="${username}" autocomplete="username"
           readonly="readonly" style="display:none;"/>
    <input type="password" id="password" name="password" autocomplete="current-password"
           style="display:none;"/>
    <div class="heysign-content heysign-content-update-password">
      <div class="heysign-content-title">
          ${msg("update-password-content-title")}
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("update-password-content-new-password")}</span>
          <span
              class="update-password-content-new-password-description">${msg("update-password-content-new-password-description")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="password-new" name="password-new" type="password" autofocus
                 autocomplete="new-password"
                 placeholder="${msg("heysign-content-password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
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
      </div>
      <div class="heysign-divider"></div>
      <div class="heysign-content-input-group">
        <div class="heysign-content-input-label margin-left-20">
          <span>${msg("update-password-content-new-confirm-password")}</span>
        </div>
        <div class="heysign-content-input-text">
          <input id="password-confirm" name="password-confirm" type="password"
                 autocomplete="new-password"
                 placeholder="${msg("heysign-content-confirm-password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
        </div>
      </div>
    </div>
    <div class="heysign-divider"></div>
    <div class="heysign-content-footer margin-bottom-20">
      <div class="heysign-content-footer-left">
        <div class="heysign-link-text heysign-content-footer-login"
             onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("heysign-go-back-to-login-link")}</span>
        </div>
      </div>
      <div class="heysign-content-footer-right">
        <div class="heysign-button" onclick="clickSubmit('kc-passwd-update-form')">
          <span>${msg("update-password-button")}</span>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
