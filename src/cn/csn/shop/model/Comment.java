package cn.csn.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.struts2.json.annotations.JSON;

/**
 * 商品评论表
 */

@Entity
public class Comment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private Integer userId;
	
	private String userName;
	
	private String content;
	
	private String stars;
	
	private Date createTime;
	
	private String isHideName;
	
	private Product product;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStars() {
		return stars;
	}

	public void setStars(String stars) {
		this.stars = stars;
	}

	@JSON(format="yyyy-MM-dd HH:mm:ss")//加上这句处理页面显示时带T的问题。
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getIsHideName() {
		return isHideName;
	}

	public void setIsHideName(String isHideName) {
		this.isHideName = isHideName;
	}

	@ManyToOne
	@JoinColumn(name = "pid")
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
