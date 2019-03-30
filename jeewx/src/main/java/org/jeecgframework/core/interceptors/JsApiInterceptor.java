package org.jeecgframework.core.interceptors;

import java.security.MessageDigest;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.jeecgframework.core.util.ResourceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.guanjia.core.util.SignUtil;

public class JsApiInterceptor implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(JsApiInterceptor.class);
    @Autowired
    private WeixinAccountServiceI weixinAccountService;

    public JsApiInterceptor() {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String nonce_str = UUID.randomUUID().toString();
        String timestamp = System.currentTimeMillis() + "";
        String signature = "";
        String jsApiTicket = this.weixinAccountService.getJsApiTicket();
        String preUrl = ResourceUtil.getConfigByName("wechat.pre");
        String url = request.getQueryString() == null ? preUrl + request.getServletPath() : preUrl + request.getServletPath() + "?" + request.getQueryString();
        logger.info("wechat url :" + url);
        String string1 = "jsapi_ticket=" + jsApiTicket + "&noncestr=" + nonce_str + "&timestamp=" + timestamp + "&url=" + url;
        logger.info("wechat sign string :" + string1);
        MessageDigest crypt = MessageDigest.getInstance("SHA-1");
        crypt.reset();
        crypt.update(string1.getBytes("UTF-8"));
        signature = SignUtil.byteToStr(crypt.digest());
        logger.info("wechat signature :" + signature);
        request.setAttribute("appId", this.weixinAccountService.findLoginWeixinAccount().getAccountappid());
        request.setAttribute("jsApiTicket", jsApiTicket);
        request.setAttribute("nonceStr", nonce_str);
        request.setAttribute("timeStamp", timestamp);
        request.setAttribute("signature", signature);
        return true;
    }
}
