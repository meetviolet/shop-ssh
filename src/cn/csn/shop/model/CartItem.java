package cn.csn.shop.model;

import java.io.Serializable;

import cn.csn.shop.model.Product;

public class CartItem implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Product product; // 购物项中的商品
	private int count; // 商品数量
	private double subtotal; // 商品小计

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getSubtotal() {
		return count * (product.getShop_price());
	}

	
}
