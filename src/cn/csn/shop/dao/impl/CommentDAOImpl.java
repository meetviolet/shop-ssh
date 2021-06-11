package cn.csn.shop.dao.impl;

import java.sql.*;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import cn.csn.shop.dao.CommentDAO;
import cn.csn.shop.model.Comment;
import cn.csn.shop.model.Order;
import cn.csn.shop.utils.PageHibernateCallback;

@Component("commentDao")
public class CommentDAOImpl implements CommentDAO {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(Comment comment) {
		
		int pid = comment.getProduct().getPid();
		if (Integer.parseInt(comment.getStars()) >= 80) {
			try {
				Class.forName("com.mysql.jdbc.Driver");			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//加载数据库驱动
			String url="jdbc:mysql://localhost:3306/shop";//声明数据库test的url
			String user="root";//数据库的用户名
			String password="root";//数据库的密码
			//建立数据库连接，获得连接对象conn(抛出异常即可)
			Connection conn;
			try {
				conn = DriverManager.getConnection(url, user, password);
				String sql="update product set is_hot = 1 where pid = " + pid;        
				Statement stmt=conn.createStatement();//创建一个Statement对象
				stmt.executeUpdate(sql);//执行sql语句
				conn.close();
				System.out.println("更新is_hot字段成功！");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		this.hibernateTemplate.save(comment);
	}

	@Override
	public int findByPid(Integer pid) {
		String hql = "select count(*) from Comment c";
		List<Long> list = null;
		if(pid > 0){
			hql += " where c.product.pid = ? order by c.createTime desc";
			list = (List<Long>) this.hibernateTemplate.find(hql, pid);
		} else {
			list = (List<Long>) this.hibernateTemplate.find(hql);
		}
		
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public void delete(Comment comment) {
		this.hibernateTemplate.delete(comment);
	}

	@Override
	public List<Comment> findByPagePid(Integer pid, int begin, int pagesize) {
		String hql = "from Comment c";
		List<Comment> list = null;
		if(pid > 0){
			hql += " where c.product.pid = ? order by c.createTime desc";
			list = (List<Comment>)this.hibernateTemplate.execute((HibernateCallback<Comment>) new PageHibernateCallback(hql, new Object[] { pid }, begin, pagesize));
		} else {
			list = (List<Comment>)this.hibernateTemplate.execute((HibernateCallback<Comment>) new PageHibernateCallback(hql, new Object[] {}, begin, pagesize));
		}
		return list;
	}

	@Override
	public Comment findById(Integer id) {
		String hql = "from Comment c where c.id=?";
		List<Comment> list = (List<Comment>)this.hibernateTemplate.find(hql, id);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

}
