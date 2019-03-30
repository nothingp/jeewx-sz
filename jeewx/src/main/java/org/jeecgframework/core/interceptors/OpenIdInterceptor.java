package org.jeecgframework.core.interceptors;

import com.alibaba.fastjson.JSON;
import com.buss.lan.entity.FtthCustomerInfoEntity;
import com.buss.lan.service.FtthCustomerInfoServiceI;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.jeecgframework.core.util.HttpClientUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.guanjia.core.entity.model.SubscribeUserInfo;
import weixin.guanjia.core.util.WeixinUtil;

public class OpenIdInterceptor implements HandlerInterceptor {
    private static final String GET_OAUTH2_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=${appid}&secret=${secret}&code=${code}&grant_type=authorization_code";
    private static final Logger logger = Logger.getLogger(OpenIdInterceptor.class);
    @Autowired
    private WeixinAccountServiceI weixinAccountService;
    
    @Autowired
    private FtthCustomerInfoServiceI ftthCustomerInfoServiceI;

    public OpenIdInterceptor() {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String openId = request.getParameter("openId");
        String resellOpenId = request.getParameter("resellOpenId");
        String code = request.getParameter("code");
        String preUrl = ResourceUtil.getConfigByName("wechat.pre");
        String url = request.getQueryString() == null ? preUrl + request.getServletPath() : preUrl + request.getServletPath() + "?" + request.getQueryString();
        logger.info("wechat url :" + url);
        logger.info("openId :" + openId);
        logger.info("code :" + code);
        String wechatAuthURL = ResourceUtil.getConfigByName("wechat.auth.url");
        String user_agent = request.getHeader("user-agent");
        String redirectUrl;
        if (user_agent != null && user_agent.indexOf("MicroMessenger") > -1 && StringUtil.isEmpty(openId)) {
            openId = (String)request.getSession().getAttribute("openId");
            if (StringUtil.isEmpty(openId)) {
                if (StringUtil.isEmpty(code)) {
                    url = url.replace("?", "%3f").replace("&", "%26").replace("=", "%3d").replace("openId", "goid").replace("isFirst%3d1", "isFirst%3d0").replace("%26null", "").replace("%3fnull", "").replace("code", "cc");
                    redirectUrl = wechatAuthURL.replace("${uri}", url);
                    response.sendRedirect(redirectUrl);
                    return false;
                }

                TokenMsg token = this.getOauthToken(code);
                openId = token.getOpenid();
            }
        }

        logger.info("openId :" + openId);
        request.getSession().setAttribute("openId", openId);
        redirectUrl = this.weixinAccountService.getAccessToken();
        SubscribeUserInfo subscribeUserInfo = WeixinUtil.getSubscribeUserInfo(redirectUrl, openId);
        request.getSession().setAttribute("subscribeUserInfo", subscribeUserInfo);
        if (StringUtil.isNotEmpty(resellOpenId)) {
            request.getSession().setAttribute("resellOpenId", resellOpenId);
        }
        
        FtthCustomerInfoEntity ftthCustomerInfoEntity = ftthCustomerInfoServiceI.findByOpenId(openId);
        //为空则记录
        if(ftthCustomerInfoEntity==null){
        	ftthCustomerInfoEntity = new FtthCustomerInfoEntity();
            ftthCustomerInfoEntity.setName(subscribeUserInfo.getNickname());
            ftthCustomerInfoEntity.setOpenId(subscribeUserInfo.getOpenid());
            ftthCustomerInfoEntity.setUpperOpenId(resellOpenId);
            ftthCustomerInfoEntity.setCreateTime(new Date());
            ftthCustomerInfoEntity.setArea("0");
            
            ftthCustomerInfoServiceI.save(ftthCustomerInfoEntity);
        }
        
        

        return true;
    }

    public TokenMsg getOauthToken(String code) {
        String u = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=${appid}&secret=${secret}&code=${code}&grant_type=authorization_code".replace("${appid}", ResourceUtil.getConfigByName("wechatAppId")).replace("${secret}", ResourceUtil.getConfigByName("wechatAppSecret")).replace("${code}", code);
        logger.info(u);
        String res = HttpClientUtil.get(u);
        if (res == null) {
            return null;
        } else {
            try {
                TokenMsg msg = (TokenMsg)JSON.parseObject(res, TokenMsg.class);
                return msg;
            } catch (Exception var5) {
                var5.printStackTrace();
                return null;
            }
        }
    }
}
