package com.panfeng.web.wearable.resource.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.panfeng.web.wearable.util.HashUtils;

@Controller
public class WecharShareController extends BaseController {

	static Token token = new Token();
	static final String appid = "wx0d76fee355493ab6";

	@RequestMapping("/get/config")
	@ResponseBody
	public String getConfig(HttpServletRequest request, String path) {
		JsonObject jsonObject = new JsonObject();
		long timestamp = System.currentTimeMillis();
		String nonceStr = create_nonce_str();
		String jsapi_ticket = token.getTicketToken();
		// 要分享页面的URL（前台页面的URL）
		String url = request.getScheme() + "://" + request.getServerName() + '/' + path;
		String str = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonceStr + "&timestamp=" + timestamp + "&url="
				+ url;
		System.err.println("str = "+str);
		System.err.println("url = "+url);
		String signature = HashUtils.sha1(str);
		jsonObject.addProperty("appId", WecharShareController.appid);
		jsonObject.addProperty("timestamp", timestamp);
		jsonObject.addProperty("nonceStr", nonceStr);
		jsonObject.addProperty("signature", signature);
		return jsonObject.toString();
	}

	// 获取微信ticketToken
	static class Token {

		static long timeOut = 7200000; // 7200秒2小时过期
		static long tokenTimestamp = 0;
		static String access_token = "";
		static String secret = "df05707cd37f60190b8735d7001bc5d8";
		static String AccessTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
				+ WecharShareController.appid + "&secret=" + secret;

		static String jsapi_ticket = "";
		static String ticket_url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi";

		public String getTicketToken() {
			if (tokenTimestamp == 0 || System.currentTimeMillis() - timeOut > tokenTimestamp) {
				refreshTicketToken(0);
			}
			return jsapi_ticket;
		}

		private void refreshAccessToken() {
			JsonObject obj = requestByGetMethod(AccessTokenUrl);
			if (obj != null && obj.get("access_token") != null) {
				access_token = obj.get("access_token").getAsString();
			}
		}

		private void refreshTicketToken(int i) {
			if (i == 3) {
				jsapi_ticket = null;
				return;
			}
			refreshAccessToken();
			String format = String.format(ticket_url, access_token);
			JsonObject obj = requestByGetMethod(format);
			if (obj != null && obj.get("ticket") != null && !access_token.equals("")) {
				jsapi_ticket = obj.get("ticket").getAsString();
				tokenTimestamp = System.currentTimeMillis();
			} else {
				i++;
				refreshTicketToken(i);
			}
		}

		private JsonObject requestByGetMethod(String url) {
			CloseableHttpClient httpClient = getHttpClient();
			System.out.println("send " + url);
			try {
				HttpGet get = new HttpGet(url);
				CloseableHttpResponse httpResponse = null;
				httpResponse = httpClient.execute(get);
				try {
					HttpEntity entity = httpResponse.getEntity();
					if (null != entity && httpResponse.getStatusLine().getStatusCode() == 200) {
						return new JsonParser().parse(EntityUtils.toString(entity)).getAsJsonObject();
					}
				} finally {
					httpResponse.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					closeHttpClient(httpClient);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return null;
		}

		private void closeHttpClient(CloseableHttpClient client) throws IOException {
			if (client != null) {
				client.close();
			}
		}

		private CloseableHttpClient getHttpClient() {
			return HttpClients.createDefault();
		}
	}

	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

}
