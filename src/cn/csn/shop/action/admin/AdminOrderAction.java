package cn.csn.shop.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.Order;
import cn.csn.shop.service.OrderService;
import cn.csn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("adminOrderAction")
@Scope("prototype")
public class AdminOrderAction extends ActionSupport implements ModelDriven<Order> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Order order = new Order();
	private OrderService orderService;
	private Integer page;

	public Order getModel() {
		return order;
	}

	@Resource
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAll() {
		PageBean<Order> pageBean = orderService.findWithPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllOrder";
	}

	public String findOrderItem() {
		Order currOrder = orderService.findByOid(order.getOid());
		List<Order> list = orderService.findOrderItem(order.getOid());
		ActionContext.getContext().getValueStack().set("list", list);
		ActionContext.getContext().getValueStack().set("orderDetail", currOrder);
		return "findOrderItem";
	}

	public String updateState() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(3);
		orderService.update(currOrder);
		return "updateState";
	}

}
