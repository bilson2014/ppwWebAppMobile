package com.panfeng.web.wearable.util;

import javax.servlet.http.HttpServletRequest;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.panfeng.web.wearable.security.AESUtil;

public class IndentUtil {

	// 生成订单token
		public static String generateOrderToken(final HttpServletRequest request,final PmsIndent indent) throws Exception {
			// 如果没有，则创建
			final StringBuffer sb = new StringBuffer();
			sb.append("{");
			sb.append("teamId:" + indent.getTeamId());
			sb.append(",productId:" + indent.getProductId());
			sb.append(",serviceId:" + indent.getServiceId());
			sb.append(",salesmanUniqueId:" + indent.getSalesmanUniqueId());
			sb.append(",product_name:" + indent.getProduct_name());
			sb.append(",service_realPrice:" + indent.getService_realPrice());
			sb.append("}");
			
			final String token = AESUtil.Encrypt(sb.toString(), PmsConstant.ORDER_TOKEN_UNIQUE_KEY);
			return token;
		}
}
