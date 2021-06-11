package cn.csn.shop.dao;

import java.util.List;

import cn.csn.shop.model.Comment;

public interface CommentDAO {

	void save(Comment comment);

	int findByPid(Integer pid);

	void delete(Comment comment);
	
	Comment findById(Integer id);

	List<Comment> findByPagePid(Integer pid, int begin, int pagesize);

}