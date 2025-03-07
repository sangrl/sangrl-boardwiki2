package kr.spring.util;

import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.api.DefaultApi20;

@Component
public class KakaoLoginApi extends DefaultApi20 {

    protected KakaoLoginApi() {
    }

    private static class InstanceHolder {
        private static final KakaoLoginApi INSTANCE = new KakaoLoginApi();
    }

    public static KakaoLoginApi instance() {
        return InstanceHolder.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://kauth.kakao.com/oauth/token";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://kauth.kakao.com/oauth/authorize";
    }
}
