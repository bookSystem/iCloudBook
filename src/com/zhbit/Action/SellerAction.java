package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;




import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Domain.Seller;
import com.zhbit.Service.SellerService;
import com.zhbit.Service.UserService;

public class SellerAction extends ActionSupport{

	@Resource
	private SellerService sellerService;
	@Resource
	private UserService userService;


	private int sellerId;
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String showSeller(){
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		Seller seller = userService.findSeller(sellerId);
		ServletActionContext.getRequest().setAttribute("seller",seller);
		List<Seller> sellerList = sellerService.showSeller(sellerId);	
		ServletActionContext.getRequest().setAttribute("showSeller",sellerList);
		return "showSeller";		
	}
	
	public String findSeller(){
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		Seller seller = userService.findSeller(sellerId);
		ServletActionContext.getRequest().setAttribute("seller",seller);
		return "findSeller";
	}
	/*
	 * 2銆佷慨鏀瑰浘涔
	 */

	public String updateSeller(){		
		Seller seller = userService.findSeller(sellerId);
		if(ServletActionContext.getRequest().getParameter("peruserpwd")!=null){
			seller.setPassword(ServletActionContext.getRequest().getParameter("peruserpwd"));
		}
		seller.setEmail(ServletActionContext.getRequest().getParameter("email"));
		seller.setTelnum(ServletActionContext.getRequest().getParameter("telnum"));
		seller.setAddress(ServletActionContext.getRequest().getParameter("address"));
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		sellerService.updateSeller(seller,sellerId);
		return "updateSeller";
		
	}
	
}
