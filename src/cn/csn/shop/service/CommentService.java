package cn.csn.shop.service;

import cn.csn.shop.model.Comment;
import cn.csn.shop.utils.PageBean;

public interface CommentService {

	void save(Comment comment);

	int findByPid(Integer pid);

	void delete(Comment comment);
	
	Comment findById(Integer id);

	PageBean<Comment> findByPagePid(Integer pid, Integer page);
}
