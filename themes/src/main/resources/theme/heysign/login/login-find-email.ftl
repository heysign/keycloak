<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <script>
        function inputValueChange(value){
            var submitElement = document.getElementById('submitDiv');
            // console.log(submitElement);
            // console.log(submitElement.classList);
            if (buttonEnabled()){
                submitElement.classList.remove("heysign-content-disabled");
            } else {
                submitElement.classList.add("heysign-content-disabled");
            }
            // console.log(submitElement.classList);
        }
        function buttonEnabled(){
            var nameValue = document.getElementById('name').value;
            var mobilePhoneNumberValue = document.getElementById('mobilePhoneNumber').value;
            // console.log(nameValue, mobilePhoneNumberValue);
            if (nameValue && nameValue.length > 0 &&
                    mobilePhoneNumberValue && mobilePhoneNumberValue.length > 0){
                // console.log('buttonEnabled true');
                return true;
            } else {
                // console.log('buttonEnabled false');
                return false;
            }
        }
        function validateAndSubmit(formId){
            if (buttonEnabled()){
                clickSubmit(formId);
            }
        }
    </script>
    <form id="kc-find-email-form" action="${url.loginAction}" method="post">
        <div class="heysign-content heysign-content-find-email">
            <div class="heysign-content-title">
                ${msg("find-email-content-title")?no_esc}
            </div>
            <div class="heysign-content-subtitle">
                ${msg("find-email-content-subtitle")?no_esc}
            </div>
            <div class="heysign-divider"></div>
            <div class="heysign-content-input-group">
                <div class="heysign-content-input-label margin-left-20">
                    <span>${msg("find-email-content-name")}</span>
                </div>
                <div class="heysign-content-input-text">
                    <input id="name" name="name" type="text"
                           autocomplete="name"
                           maxlength="50"
                           autofocus onchange="inputValueChange(event.target.value)"
                           value="${(name!'')}"
                           placeholder="${msg("heysign-content-name-placeholder")}"/>
                </div>
            </div>
            <div class="heysign-divider"></div>
            <div class="heysign-content-input-group">
                <div class="heysign-content-input-label margin-left-20">
                    <span>${msg("find-email-content-mobile-phone-number")}</span>
                </div>
                <div class="heysign-content-input-text">
                    <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"
                           autocomplete="mobilePhoneNumber"
                           maxlength="20"
                           onchange="inputValueChange(event.target.value)"
                           value="${(mobilePhoneNumber!'')}"
                           placeholder="${msg("heysign-content-mobile-phone-number-placeholder")}"/>
                </div>
            </div>
            <div class="heysign-divider"></div>
            <div class="heysign-content-footer margin-bottom-20">
                <div class="heysign-link-text heysign-content-footer-login" onclick="goToUrl('${url.loginUrl}')">
                    <span>${msg("heysign-go-back-to-login-link")}</span>
                </div>
                <div id="submitDiv" class="heysign-button heysign-content-disabled margin-left-336" onclick="validateAndSubmit('kc-find-email-form')">
                    <span>${msg("find-email-button")}</span>
                </div>
            </div>
        </div>
    </form>
</@layout.registrationLayout>
