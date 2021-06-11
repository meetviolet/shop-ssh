package cn.csn.shop.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.AdminUser;
import cn.csn.shop.service.AdminUserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport implements ModelDriven<AdminUser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AdminUser adminUser = new AdminUser();
	private AdminUserService adminUserService;

	@Resource
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	public AdminUser getModel() {
		return adminUser;
	}

	public String login() {
		AdminUser existAdminUser = adminUserService.find(adminUser);
		if (existAdminUser == null) {
			this.addActionError("用户名或密码错误!请重新输入");
			return "loginFail";
		} else {
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}

	public String logout() {
		ServletActionContext.getRequest().getSession().removeAttribute("existAdminUser");
		return "loginSuccess";
	}
	
	public String changePsd() {
		return "modifyPsd";
	}
	
	public String modifyPsd() {
		AdminUser currUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		currUser.setPassword(adminUser.getPassword());
		adminUserService.updatePsd(currUser);
		this.addActionMessage("密码修改成功！");
		ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", currUser);
		return "modifyPsd";
	}

}
