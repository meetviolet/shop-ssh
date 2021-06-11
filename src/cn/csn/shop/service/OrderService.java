package cn.csn.shop.service;

import java.util.List;

import cn.csn.shop.model.Order;
import cn.csn.shop.utils.PageBean;

public interface OrderService {

	void save(Order order);

	PageBean findByPageUid(Integer uid, Integer page);

	Order findByOid(Integer oid);

	void update(Order currOrder);

	PageBean<Order> findWithPage(Integer page);

	List<Order> findOrderItem(Integer oid);

}
