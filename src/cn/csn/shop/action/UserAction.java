package cn.csn.shop.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.User;
import cn.csn.shop.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private UserService userService;
	private String checkcode;
	private String oldPsd;
	private Map<String, Object> jsonResult;
	private String checkUserName;

	public String registPage() {
		return "registPage";
	}
	
	public String aboutPage() {
		return "aboutPage";
	}
	
	public String centerPage() {
		return "centerPage";
	}

	public String update() throws IOException {
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		String msg = null;
		if (u == null) {
			return "loginError";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		if(!oldPsd.equals(u.getPassword())){
			map.put("state", false);
			map.put("message", "原密码错误！");
		} else {
			u.setPassword(user.getPassword());
			u.setEmail(user.getEmail());
			u.setPhone(user.getPhone());
			u.setAddr(user.getAddr());
			
			userService.updatePsd(u);
			map.put("state", true);
			map.put("message", msg);
		}
		
		jsonResult = map;

		return "updatePsd";
	}
	
	public String isExist() throws IOException {
		User u = userService.findByUsername(checkUserName);
		String msg = null;
		if (u != null) {
			msg = "用户名已存在";
		} else {
			msg = "用户名可以使用";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", true);
		map.put("message", msg);
		jsonResult = map;

		return "checkSuccess";
	}

	public String regist() {
		User u = userService.findByUsername(user.getUsername());
		if (u != null) {
			this.addActionError("用户已存在!");
			return "registPage";
		} else {
			userService.add(user);
			this.addActionMessage("恭喜你注册成功!");
			return "msg";
		}
	}

	public String loginPage() {
		return "loginPage";
	}

	public String login() {
		String code = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if (!checkcode.equalsIgnoreCase(code)) {
			this.addActionError("验证码不正确!");
			return "codeError";
		}
		User existUser = userService.find(user);
		if (existUser == null) {
			this.addActionError("用户名或密码不正确!请重新输入!");
			return "loginError";
		} else {
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
		}
		return "loginSuccess";
	}

	public String quit() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

	public String checkImg() {
		return "checkImg";
	}

	public Object getModel() {
		return user;
	}

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public String getCheckUserName() {
		return checkUserName;
	}

	public void setCheckUserName(String checkUserName) {
		this.checkUserName = checkUserName;
	}

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getOldPsd() {
		return oldPsd;
	}

	public void setOldPsd(String oldPsd) {
		this.oldPsd = oldPsd;
	}
}
