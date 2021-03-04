<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <script>
        function isEmailValid(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }
        function emailOnChange(value){
            if (buttonEnabled(value)){
                document.getElementById('submitDiv').classList.remove("heysign-content-disabled");
            } else {
                document.getElementById('submitDiv').classList.add("heysign-content-disabled");
            }
        }
        function buttonEnabled(inputEmail){
            if (inputEmail !== undefined && inputEmail != null && inputEmail.length > 0 && isEmailValid(inputEmail)){
                return true;
            } else {
                return false;
            }
        }
        function validateAndSubmit(formId){
            var email = document.getElementById('email').value;
            if (buttonEnabled(email)){
                clickSubmit(formId);
            }
        }
    </script>
    <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
        <div class="heysign-content heysign-content-reset-password">
            <div class="heysign-content-title">
                ${msg("reset-password-content-title")}
            </div>
            <div class="heysign-content-subtitle">
                ${msg("reset-password-content-subtitle")?no_esc}
            </div>
            <div class="heysign-content-input-group margin-top-30">
                <div class="heysign-content-input-label">
                    <span>${msg("register-content-email")}</span>
                </div>
                <div class="heysign-content-input-text">
                    <input id="email" name="username" type="text"
                           autocomplete="email"
                           maxlength="100"
                           autofocus onchange="emailOnChange(event.target.value)"
                           placeholder="${msg("heysign-content-email-placeholder")}"/>
                </div>
            </div>
            <div id="submitDiv" class="heysign-button heysign-content-disabled" onclick="validateAndSubmit('kc-reset-password-form')">
                <span>${msg("reset-password-button")}</span>
            </div>
            <div class="heysign-content-footer">
                <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${url.loginUrl}')">
                    <span>${msg("heysign-go-back-to-login-link")}</span>
                </div>
            </div>
        </div>
    </form>
</@layout.registrationLayout>