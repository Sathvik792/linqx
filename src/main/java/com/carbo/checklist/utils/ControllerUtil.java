package com.carbo.checklist.utils;

import org.springframework.security.oauth2.provider.OAuth2Authentication;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Map;

public class ControllerUtil {
    public static String getOrganizationId(HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        return ((Map) ((OAuth2Authentication) principal).getUserAuthentication().getDetails()).get("organizationId").toString();
    }
}
