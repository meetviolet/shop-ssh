package cn.csn.shop.action;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.Cart;
import cn.csn.shop.model.CartItem;
import cn.csn.shop.model.Order;
import cn.csn.shop.model.OrderItem;
import cn.csn.shop.service.OrderService;
import cn.csn.shop.model.User;
import cn.csn.shop.utils.PageBean;
/*import cn.csn.utils.PaymentUtil;*/
import cn.csn.shop.utils.PaymentUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("orderAction")
@Scope("prototype")
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Order order = new Order();
	private OrderService orderService;
	private Integer page;
	private String pd_FrpId;
	private String r3_Amt;
	private String r6_Order;

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	@Resource
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	
	public String save() {
		order.setOrdertime(new Date());
		order.setState(1); // 1.未付款 2.已付款,没发货 3.已发货,但还没有确认收货 4.交易完成
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if (cart == null) {
			this.addActionError("亲！还没有购物，请前往购物！");
			return "msg";
		}
		order.setTotal(cart.getTotal());
		for (CartItem cartItem : cart.getCartItems()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);
			order.getOrderItems().add(orderItem);
		}
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if (existUser == null) {
			this.addActionError("亲!请先登录!");
			return "loginPage";
		}
		order.setUser(existUser);
		orderService.save(order);
		cart.clearCart();
		return "saveOrder";
	}

	public String findByUid() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		PageBean pageBean = orderService.findByPageUid(user.getUid(), page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "myOrder";
	}

	public String findByOid() {
		order = orderService.findByOid(order.getOid());
		return "findByOid";
	}

	public String payOrder() throws IOException {
		
		return this.callBack();
	}

	 
	// 付款成功后跳转回来的路径:
	public String callBack() {
		// 修改订单的状态:
		Order currOrder = orderService.findByOid(order.getOid());
		// 修改订单状态为2:已经付款:
		currOrder.setState(2);
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		orderService.update(currOrder);
		this.addActionMessage("订单编号为: " + order.getOid() + "的订单下单成功！");
		return "msg";
	}

	
	public String updateState() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(4);
		orderService.update(currOrder);
		return "updateState";
	}

	public Order getModel() {
		return order;
	}
}
