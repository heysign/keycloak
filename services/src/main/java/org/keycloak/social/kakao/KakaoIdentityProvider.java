/*
 * Copyright 2016 Red Hat, Inc. and/or its affiliates
 * and other contributors as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.keycloak.social.kakao;

import com.fasterxml.jackson.databind.JsonNode;
import org.keycloak.broker.oidc.AbstractOAuth2IdentityProvider;
import org.keycloak.broker.oidc.OAuth2IdentityProviderConfig;
import org.keycloak.broker.oidc.mappers.AbstractJsonUserAttributeMapper;
import org.keycloak.broker.provider.util.SimpleHttp;
import org.keycloak.broker.provider.BrokeredIdentityContext;
import org.keycloak.broker.provider.IdentityBrokerException;
import org.keycloak.broker.social.SocialIdentityProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.utils.IdentityProviderUtils;

/**
 * @author <a href="mailto:yoonjoo.jang@gmail.com">YoonJoo jang</a>
 */
public class KakaoIdentityProvider extends AbstractOAuth2IdentityProvider implements SocialIdentityProvider {

	public static final String AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
	public static final String TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	public static final String PROFILE_URL = "https://kapi.kakao.com/v2/user/me";
	public static final String DEFAULT_SCOPE = "";

	public KakaoIdentityProvider(KeycloakSession session, OAuth2IdentityProviderConfig config) {
		super(session, config);
		config.setAuthorizationUrl(AUTH_URL);
		config.setTokenUrl(TOKEN_URL);
		config.setUserInfoUrl(PROFILE_URL);
	}

	protected BrokeredIdentityContext doGetFederatedIdentity(String accessToken) {
		try {
			JsonNode raw = SimpleHttp.doGet(PROFILE_URL,session).auth(accessToken).asJson();
			
			JsonNode account = raw.get("kakao_account");
			JsonNode profile = account.get("profile");
			
			logger.debug(raw.toString());
			logger.debug(account.toString());
			logger.debug(profile.toString());
			
			String id = getJsonProperty(raw, "id");

			BrokeredIdentityContext user = new BrokeredIdentityContext(id);

			String full_name = getJsonProperty(profile, "nickname");
			IdentityProviderUtils.setName(user, full_name);

			String email = getJsonProperty(account, "email");
			user.setEmail(email);
			user.setUsername(email);
			
			user.setIdpConfig(getConfig());
			user.setIdp(this);

			AbstractJsonUserAttributeMapper.storeUserProfileForMapper(user, account, getConfig().getAlias());

			return user;
		} catch (Exception e) {
			throw new IdentityBrokerException("Could not obtain user profile from kakao.", e);
		}
	}

	@Override
	protected String getDefaultScopes() {
		return DEFAULT_SCOPE;
	}
}