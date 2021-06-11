package cn.csn.shop.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.csn.shop.model.Comment;
import cn.csn.shop.model.User;
import cn.csn.shop.service.CommentService;
import cn.csn.shop.utils.PageBean;

@Component("commentAction")
@Scope("prototype")
public class CommentAction extends ActionSupport implements ModelDriven<Comment> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Comment comment = new Comment();
	private CommentService commentService;

	private Integer pid;
	private Integer page;
	private Map<String, Object> jsonResult;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Comment getModel() {
		return comment;
	}

	public CommentService getCommentService() {
		return commentService;
	}

	@Resource
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public String findByPagePid() {
		PageBean<Comment> pageBean = commentService.findByPagePid(pid, page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageBean", pageBean);
		jsonResult = map;
		
		return "commentList";
	}
	
	public String addComment() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("existUser");
		
		comment.setUserId(user.getUid());
		comment.setUserName(user.getUsername());
		comment.setCreateTime(new Date());
		commentService.save(comment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		jsonResult = map;
		
		return "commentList";
	}
	
	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}

}
