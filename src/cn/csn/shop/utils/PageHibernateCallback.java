package cn.csn.shop.utils;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;

public class PageHibernateCallback<T> implements HibernateCallback<List<T>> {

	private String hql;
	private Object[] params;//实际参数
	private int startIndex;//数据起始位置
	private int pageSize;//每页显示数据条数

	public PageHibernateCallback(String hql, Object[] params, int startIndex, int pageSize) {
		super();
		this.hql = hql;
		this.params = params;
		this.startIndex = startIndex;
		this.pageSize = pageSize;
	}

	public List<T> doInHibernate(Session session) throws HibernateException {
		// 1 执行hql语句
		Query query = session.createQuery(hql);
		// 2 实际参数
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}
		// 3 分页
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);

		return query.list();
	}

	

}
