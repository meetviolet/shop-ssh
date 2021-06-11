package cn.csn.shop.dao;

import java.util.List;

import cn.csn.shop.model.Order;

public interface OrderDAO {

	void save(Order order);

	int findByUid(Integer uid);

	List<Order> findByPageUid(Integer uid, int begin, int pagesize);

	Order findByOid(Integer oid);

	void update(Order currOrder);

	int findCount();

	List<Order> findWithPage(int begin, int pagesize);

	List<Order> findOrderItem(Integer oid);

}
