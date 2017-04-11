package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.panfeng.web.wearable.resource.model.Solr;
import com.panfeng.web.wearable.resource.view.SolrView;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
public class SolrController extends BaseController {

	final Logger logger = LoggerFactory.getLogger("error");

	final Logger serLogger = LoggerFactory.getLogger("service");
	
	final Logger keywordsLogger = LoggerFactory.getLogger("keywords");

	@RequestMapping("/search")
	public ModelAndView phoneSearchView(String q, final String sequence, final int sortord, final String item,
			final ModelMap model, final HttpServletRequest request) throws Exception {
		if ("".equals(q)) {
			q = "*";
		}
		model.addAttribute("q", q);
		model.addAttribute("sequence", sequence);
		model.addAttribute("sortord", sortord);
		model.addAttribute("item", item);
		SolrView view = new SolrView();
		view.setCondition(URLEncoder.encode(q, "UTF-8"));
		view.setItemFq(item);
		view.setSequence(sequence);
		view.setSortord(sortord);
		try {
			String url = PublicConfig.URL_PREFIX + "portal/solr/phone/query";
			final String json = HttpUtil.httpPost(url, view, request);
			if (json != null && !"".equals(json)) {
				List<Solr> list = JsonUtil.fromJsonArray(json, Solr.class);
				
				model.addAttribute("list", list);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error("SolrController method:phoneSearchView() encode failue,q=" + q);
		}
		
		if("*".equals(q)) {
			String cdn = q.trim().replaceAll("(\\s*)(,|，|\\s+)(\\s*)", ",");
			keywordsLogger.info("q=" + cdn);
		}
		return new ModelAndView("/search");
	}

	@RequestMapping("/suggest/{token}")
	public List<Solr> suggest(@PathVariable("token") final String token, final HttpServletRequest request) {

		if (token != null && !"".equals(token)) {
			try {
				final String word = URLDecoder.decode(token, "UTF-8");

				String url = PublicConfig.URL_PREFIX + "portal/solr/suggest/" + word;
				final String json = HttpUtil.httpGet(url, request);
				if (json != null && !"".equals(json)) {
					List<Solr> list = JsonUtil.fromJsonArray(json, Solr.class);
					return list;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
