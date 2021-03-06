package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.PmsResult;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.DateUtils;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.sales.entity.PmsSalesman;
import com.paipianwang.pat.facade.sales.service.PmsSalesmanFacade;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.team.service.PmsTeamFacade;
import com.panfeng.web.wearable.util.IndentUtil;

@RestController
public class SalesmanController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log

	final Logger logger = LoggerFactory.getLogger("error");

	@Autowired
	final private PmsTeamFacade pmsTeamFacade = null;

	@Autowired
	final private PmsProductFacade pmsProductFacade = null;

	@Autowired
	private PmsSalesmanFacade pmsSalesmanFacade = null;

//	@Autowired
//	private PmsIndentFacade pmsIndentFacade = null;

	/*@Autowired
	private PmsServiceFacade pmsServiceFacade = null;

	@Autowired
	private SmsMQService smsMQService = null;
	
	@Autowired
	private IndentService indentService;*/

	/**
	 * 手机分销人直接下单页
	 */
	@RequestMapping("/salesman/order/{uniqueId}")
	public ModelAndView orderView(@PathVariable("uniqueId") final String uniqueId, final HttpServletRequest request,
			final ModelMap model) {

		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if (isValid(uniqueId)) {

			final PmsIndent indent = new PmsIndent();
			indent.setTeamId(-1l);
			indent.setProductId(-1l);
			indent.setServiceId(-1l);
			indent.setSalesmanUniqueId(uniqueId);

			try {
				final String token = IndentUtil.generateOrderToken(request, indent);
				model.addAttribute("token", token);
			} catch (Exception e) {
				logger.error(
						"method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
				e.printStackTrace();
			}

			return new ModelAndView("/salesman/order", model);
		}

		return new ModelAndView("/salesman/error");
	}

	/**
	 * 手机分销人直接下单页
	 */
	@RequestMapping("/salesman/order/{productId}/{uniqueId}")
	public ModelAndView orderView(@PathVariable("productId") final Long productId,
			@PathVariable("uniqueId") final String uniqueId, final ModelMap model, final HttpServletRequest request) {

		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if (isValid(uniqueId)) {

			final PmsProduct product = pmsProductFacade.loadProduct(Integer.valueOf(productId + ""));
			if (product.getTeamId() != null && !"".equals(product.getTeamId())) {
				final PmsTeam team = pmsTeamFacade.findTeamById(product.getTeamId());
				if (team != null) {
					product.setTeamDescription(team.getTeamDescription());
					product.setTeamName(team.getTeamName());
					product.setTeamPhotoUrl(team.getTeamPhotoUrl());
				}
			}
			try {
				final PmsIndent indent = new PmsIndent();
				indent.setTeamId(product.getTeamId());
				indent.setProductId(product.getProductId());
				indent.setServiceId(product.getServiceId());
				indent.setSalesmanUniqueId(uniqueId);
				final String token = IndentUtil.generateOrderToken(request, indent);

				model.addAttribute("token", token);
				model.addAttribute("recomment",
						"样片名称:" + product.getProductName() + ",价格:" + product.getServiceRealPrice());
			} catch (Exception e) {
				logger.error(
						"method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
				e.printStackTrace();
			}
			return new ModelAndView("/salesman/order", model);
		}

		return new ModelAndView("/salesman/error", model);
	}

	/**
	 * 分销人移动端-提交订单
	 * 
	 * @throws UnsupportedEncodingException
	 */
	/*@RequestMapping(value = "/salesman/order/submit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ModelAndView successViewOnPhone(final PmsIndent indent, final HttpServletRequest request,
			final ModelMap model) throws UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		
		Result result=indentService.saveIndent(indent, request.getSession());
		if(result.isRet()){
			return new ModelAndView("/salesman/success");
		}else{
			return new ModelAndView("/salesman/error");
		}
		try {
			String token = indent.getToken();
			// token 解密
			token = AESUtil.Decrypt(token, PmsConstant.ORDER_TOKEN_UNIQUE_KEY);
			final PmsIndent nIndent = JsonUtil.toBean(token, PmsIndent.class);
			if(ValidateUtil.isValid(nIndent.getSalesmanUniqueId())){
				final PmsSalesman salesman = pmsSalesmanFacade.findSalesmanByUniqueId(nIndent.getSalesmanUniqueId());
				if(salesman!=null){
					indent.setIndentName("分销-"+salesman.getSalesmanName()+"-财神促销");
				}
			}
			indent.setTeamId(nIndent.getTeamId());
			indent.setProductId(nIndent.getProductId());
			indent.setServiceId(nIndent.getServiceId());
			indent.setSalesmanUniqueId(nIndent.getSalesmanUniqueId());
			
			long teamId = indent.getTeamId();
			long productId = indent.getProductId();
			Long serviceId = indent.getServiceId();
			String productName = null;
			// 如果按产品下单，那么下单之后的订单信息需要与数据库进行对比
			if (teamId != -1 && productId != -1 && serviceId != -1) {
				// 产品下单
				final PmsProduct product = pmsProductFacade.findProductById(productId);
				productName = product.getProductName();
				final PmsService ser = pmsServiceFacade.getServiceById(serviceId);
				indent.setSecond(ser.getMcoms());
				indent.setIndentPrice(ser.getServiceRealPrice());
				indent.setProduct_name(productName);
			}			

			boolean res = pmsIndentFacade.saveOrder(indent);
			if (res) {
				String telephone = PublicConfig.PHONENUMBER_ORDER;
				if (indent.getSendToStaff()) {
					if (StringUtils.isBlank(productName)) {
						smsMQService.sendMessage("131844", telephone,
								new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【未指定具体影片】" });
					} else {
						smsMQService.sendMessage("131844", telephone,
								new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【" + productName + "】" });
					}
				}
				// 发送短信给用户下单成功
				if (indent.getSendToUser()) {
					smsMQService.sendMessage("131329", indent.getIndent_tele(), null);
				}
				return new ModelAndView("/salesman/success");
			}

		} catch (Exception e) {
			logger.error("SalesmanController method:successViewOnPhone() Order encode Failure ...");
			e.printStackTrace();
		}
		return new ModelAndView("/salesman/error");
	}*/
	@RequestMapping("/salesman/{uniqueId}")
	public ModelAndView page(@PathVariable("uniqueId") final String uniqueId, final ModelMap model,
			final HttpServletRequest request) {

		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if (isValid(uniqueId)) {

			model.addAttribute("uniqueId", uniqueId);
			return new ModelAndView("/salesman/portal");
		}

		// 跳转至分销人的错误页面上来
		return new ModelAndView("/salesman/error");

	}

	@RequestMapping("/salesman/load/product")
	public List<PmsProduct> loadSalesProduct(final HttpServletRequest request) {

		final List<PmsProduct> list = pmsProductFacade.loadSalesProduct();
		return list;
	}

	/**
	 * 验证uniqueId是否合法
	 * 
	 * @param request
	 * @param salesman
	 * @return
	 */
	public boolean isValid(final String uniqueId) {
		final List<PmsSalesman> saleman = pmsSalesmanFacade.findSalesmanByUniqueId(uniqueId,PmsSalesman.TYPE_MOBILE);
		return ValidateUtil.isValid(saleman) ? true : false;
	}

	// 判断一个字符串是否含有数字
	public boolean HasDigit(String content) {
		boolean flag = false;
		Pattern p = Pattern.compile(".*\\d+.*");
		Matcher m = p.matcher(content);
		if (m.matches()) {
			flag = true;
		}
		return flag;
	}

	/**
	 * mg
	 */
	@RequestMapping("/mgtoutiao")
	public ModelAndView orderView(final HttpServletRequest request, final ModelMap model) {

		final PmsIndent indent = new PmsIndent();
		indent.setTeamId(-1l);
		indent.setProductId(-1l);
		indent.setServiceId(-1l);
		indent.setSalesmanUniqueId("MG活动下单");
		try {
			final String token = IndentUtil.generateOrderToken(request, indent);
			model.addAttribute("token", token);
		} catch (Exception e) {
			logger.error(
					"method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
			e.printStackTrace();
		}
		// modify by Jack,2016-06-23 10:28 end

		return new ModelAndView("/salesman/mgActive", model);

	}
	
	//---------------分销-团购--------------------
	/**
	 * 发起分销团购 -- 还不使用
	 * @param request
	 * @param old
	 * @return
	 */
	/*@RequestMapping("/salesman/start")
	public PmsResult createSales(final HttpServletRequest request,PmsSalesman old) {
		SessionInfo session=getCurrentInfo(request);
		//生成分销id
		String uniqueId="";
		if(session!=null) {
			//登录
			if(PmsConstant.ROLE_CUSTOMER.equals(session.getSessionType())) {
				uniqueId="c";
			}else if(PmsConstant.ROLE_EMPLOYEE.equals(session.getSessionType())) {
				uniqueId="e";
			}else if(PmsConstant.ROLE_PROVIDER.equals(session.getSessionType())) {
				uniqueId="t";
			}		
			uniqueId=uniqueId+"_"+session.getRealName()+"_";	
		}
		
		uniqueId+=new Date().getTime();
		
		//编码
		Base64.Encoder encoder=Base64.getEncoder();
		byte[] textByte;
		try {
			textByte = uniqueId.getBytes("UTF-8");
			uniqueId=encoder.encodeToString(textByte);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		PmsResult result=new PmsResult();
		
		//插入分销信息  一个总的分销，传salesmanId 
		List<PmsSalesman> salesmans=pmsSalesmanFacade.findSalesmanByUniqueId(old.getUniqueId(), PmsSalesman.TYPE_MOBILE);//移动
		if(!ValidateUtil.isValid(salesmans)) {
			result.setResult(false);
			result.setMsg("分销活动不存在");
			return result;
		}
		
		PmsSalesman salesman=new PmsSalesman();
		salesman.setSalesmanName(salesmans.get(0).getSalesmanName()+(session==null?"":"_"+session.getRealName()));//名称
		salesman.setBelongs(salesmans.get(0).getBelongs());
		salesman.setPlatform(salesmans.get(0).getPlatform());
		salesman.setUniqueId(salesmans.get(0).getUniqueId()+uniqueId);//唯一标记
		salesman.setType(salesmans.get(0).getType());
		
		salesman.setAccessurl(salesmans.get(0).getAccessurl());
		salesman.setOrderUrl(salesmans.get(0).getOrderUrl());
		salesman.setIndentSource(salesmans.get(0).getIndentSource());
			
		salesman.setSalesmanDescription(salesmans.get(0).getSalesmanDescription()+"  分销人：");//描述
		
		pmsSalesmanFacade.save(salesman);
		
		//分销地址：
		result.setMsg("https://m.apaipian.com"+salesman.getAccessurl().replace("{uniqueId}", salesman.getUniqueId()));
		
		return result;
	}*/
	
	/**
	 * 根据分销活动及标记查询分销页面
	 * @param salesName
	 * @param uniqueId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/salesman/{salesName}/{pageName}/{uniqueId}")
	public ModelAndView page(@PathVariable("salesName") final String salesName,@PathVariable("pageName") final String pageName,@PathVariable("uniqueId") final String uniqueId, final ModelMap model,
			final HttpServletRequest request) {

		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if (isValid(uniqueId)) {

			model.addAttribute("uniqueId", uniqueId);
			//分销参数
			return new ModelAndView("/salesman/"+salesName+"/"+pageName);
		}

		// 跳转至分销人的错误页面上来
		return new ModelAndView("/salesman/error");
	}
}
