package org.jeecgframework.core.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpClientUtil {
    static HttpClient httpClient;

    public HttpClientUtil() {
    }

    public static String get(String url) {
    	HttpResponse httpReponse = null;
        String result = null;
        HttpGet httpget = null;

        try {
            httpget = new HttpGet(url);
            httpget.addHeader(new BasicHeader("", ""));
            httpget.addHeader("Content-Type", "application/json; encoding=utf-8");
            httpReponse = httpClient.execute(httpget);
            HttpEntity entity = httpReponse.getEntity();
            result = EntityUtils.toString(entity, "utf-8");
        } catch (ClientProtocolException var15) {
            var15.printStackTrace();
        } catch (IOException var16) {
            var16.printStackTrace();
        } 

        return result;
    }

    public static String post(String url, Map<String, String> params) {
    	HttpResponse httpReponse = null;
        String result = null;
        HttpPost httppost = null;

        try {
            httppost = new HttpPost(url);
            StringBuffer sb = new StringBuffer();
            if (params != null) {
                Iterator i$ = params.entrySet().iterator();

                while(i$.hasNext()) {
                    Entry<String, String> e = (Entry)i$.next();
                    sb.append((String)e.getKey());
                    sb.append("=");
                    sb.append((String)e.getValue());
                    sb.append("&");
                }

                sb.substring(0, sb.length() - 1);
            }

            StringEntity e = new StringEntity(sb.toString());
            e.setContentType("application/x-www-form-urlencoded");
            httppost.setEntity(e);
            httpReponse = httpClient.execute(httppost);
            System.out.println(httpReponse.getStatusLine());
            HttpEntity entity = httpReponse.getEntity();
            result = EntityUtils.toString(entity);
        } catch (ClientProtocolException var18) {
            var18.printStackTrace();
        } catch (IOException var19) {
            var19.printStackTrace();
        } finally {
//            try {
//                httpReponse.close();
//            } catch (IOException var17) {
//                var17.printStackTrace();
//            }
//
//            httppost.releaseConnection();
        }

        return result;
    }

    public static String post(String url, Map<String, String> params, String charset) {
    	HttpResponse response = null;
        String result = null;
        HttpPost request = null;

        try {
            request = new HttpPost(url);
            List<NameValuePair> parameters = new ArrayList();
            Iterator i$ = params.entrySet().iterator();

            while(i$.hasNext()) {
                Entry<String, String> entry = (Entry)i$.next();
                if (entry.getValue() != null) {
                    parameters.add(new BasicNameValuePair((String)entry.getKey(), ((String)entry.getValue()).toString()));
                }
            }

            UrlEncodedFormEntity formEntiry = new UrlEncodedFormEntity(parameters, charset);
            request.setEntity(formEntiry);
            response = httpClient.execute(request);
            System.out.println(response.getStatusLine());
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity);
        } catch (UnsupportedEncodingException var21) {
            var21.printStackTrace();
        } catch (ClientProtocolException var22) {
            var22.printStackTrace();
        } catch (IOException var23) {
            var23.printStackTrace();
        } 

        return result;
    }

    public static String post(String url, String body) {
    	HttpResponse httpReponse = null;
        String result = null;

        try {
            HttpPost httppost = new HttpPost(url);
            StringEntity e = new StringEntity(body, "utf-8");
            e.setContentType("application/x-www-form-urlencoded");
            httppost.setEntity(e);
            httpReponse = httpClient.execute(httppost);
            System.out.println(httpReponse.getStatusLine());
            HttpEntity entity = httpReponse.getEntity();
            result = EntityUtils.toString(entity);
        } catch (ClientProtocolException var17) {
            var17.printStackTrace();
        } catch (IOException var18) {
            var18.printStackTrace();
        } 

        return result;
    }

    public static void main(String[] args) throws ClientProtocolException, IOException {
        String s = "{\"touser\":\"opqLMt4C_Wkj5-gP5Ed4x04l9xy8\",\"msgtype\":\"text\",\"text\":{\"content\":\"<a href=\\\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect\\\">hello, ace</a>\"}}";
        System.out.println(s);
        String access_token = "G1apVvsOGRRu0a6bHmI-iN84eyQ_w0lZZHqIRUVag3KlZ8WXx5K9kP6FwI8bNki9";
        System.out.println(post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + access_token, s));
    }

    static {
        //PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        //cm.setMaxTotal(5000);
        //cm.setDefaultMaxPerRoute(5000);
        //RequestConfig defaultRequestConfig = RequestConfig.custom().setSocketTimeout(50000).setConnectTimeout(50000).setConnectionRequestTimeout(50000).setStaleConnectionCheckEnabled(true).build();
        httpClient = new DefaultHttpClient();
    }
}
