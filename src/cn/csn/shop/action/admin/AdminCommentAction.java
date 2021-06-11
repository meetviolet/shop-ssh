package cn.csn.shop.action.admin;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.csn.shop.model.Comment;
import cn.csn.shop.service.CommentService;
import cn.csn.shop.utils.PageBean;

@Component("adminCommentAction")
@Scope("prototype")
public class AdminCommentAction extends ActionSupport implements ModelDriven<Comment> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Comment comment = new Comment();
	private Integer page;
	private CommentService commentService;

	public void setPage(Integer page) {
		this.page = page;
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

	public Integer getPage() {
		return page;
	}

	public String findAll() {
		PageBean<Comment> pageBean = commentService.findByPagePid(0, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	public String delete() {
		comment = commentService.findById(comment.getId());
		commentService.delete(comment);
		return "delete";
	}
}
