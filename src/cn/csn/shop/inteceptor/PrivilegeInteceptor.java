package cn.csn.shop.inteceptor;

import org.apache.struts2.ServletActionContext;

import cn.csn.shop.model.AdminUser;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PrivilegeInteceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession()
				.getAttribute("existAdminUser");
		if (existAdminUser == null) {
			ActionSupport actionSupport = (ActionSupport) actionInvocation.getAction();
			actionSupport.addActionError("您没有访问权限!请登录!");
			return "loginError";
		} else {
			return actionInvocation.invoke();
		}
	}

}
