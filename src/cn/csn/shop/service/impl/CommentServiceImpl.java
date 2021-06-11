package cn.csn.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import cn.csn.shop.dao.CommentDAO;
import cn.csn.shop.model.Comment;
import cn.csn.shop.service.CommentService;
import cn.csn.shop.utils.PageBean;

@Component("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {

	private CommentDAO commentDao;
	
	public CommentDAO getCommentDao() {
		return commentDao;
	}

	@Resource
	public void setCommentDao(CommentDAO commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public void save(Comment comment) {
		this.commentDao.save(comment);
	}

	@Override
	public int findByPid(Integer pid) {
		return this.commentDao.findByPid(pid);
	}

	@Override
	public void delete(Comment comment) {
		this.commentDao.delete(comment);
	}

	@Override
	public PageBean<Comment> findByPagePid(Integer pid, Integer page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		pageBean.setPage(page);
		int pagesize = 10;
		pageBean.setPagesize(pagesize);
		int total = this.commentDao.findByPid(pid);
		pageBean.setTotal(total);
		int pageCount = 0;
		if (total / pagesize == 0) {
			pageCount = total / pagesize;
		} else {
			pageCount = total / pagesize + 1;
		}
		pageBean.setPageCount(pageCount);
		int begin = (page - 1) * pagesize;
		List<Comment> list = this.commentDao.findByPagePid(pid, begin, pagesize);
		pageBean.setProList(list);
		return pageBean;
	}

	@Override
	public Comment findById(Integer id) {
		return this.commentDao.findById(id);
	}
	
}
