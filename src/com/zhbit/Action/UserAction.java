package com.zhbit.Action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;
import com.zhbit.Service.UserService;



public class UserAction extends ActionSupport{
	/**
	 * 
	 */
	

	private static final long serialVersionUID = 1L;
	@SuppressWarnings("all")
	@Resource
	private UserService userService;
	private String name;
	private String password;
	private String repassword;
	private String email;
	private String telnum;
	private String address;
	private String person;
	
	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelnum() {
		return telnum;
	}

	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/*
	 * 1銆佺敤鎴锋敞鍐�
	 */
	public String regist(){
		if(person.equals("user")){
			Boolean flag  = userService.ifUserRegist(name);
			if(flag){
				if(password.equals(repassword)){
					User user = new User();
					user.setName(name);
					user.setPassword(password);
					/*user.setRepassword(repassword);*/
					user.setEmail(email);
					user.setTelnum(telnum);
					user.setAddress(address);
					User u =  userService.regist(user);
					ServletActionContext.getRequest().getSession()
					.setAttribute("user", u);
					return "regist_sucess";
				}
				
			}
		}
		
		if(person.equals("seller")){
			Boolean flag = userService.ifSellerRegist(name);
			if(flag){
				if(password.equals(repassword)){
					Seller seller = new Seller();
					seller.setName(name);
					seller.setPassword(password);
					/*seller.setRepassword(repassword);*/
					seller.setTelnum(telnum);
					seller.setEmail(email);
					seller.setAddress(address);
					userService.regist(seller);
					
					return "regist_sucess";
				}
				
				
			}
		}
		
		return "regist";
	}
	
	
	/*
	 * 2銆佺敤鎴风櫥褰�
	 */

	public String login() {
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		
		if(person.equals("user")){
			User user1 = userService.login(user);
			if (user1 != null) {
				ServletActionContext.getRequest().getSession()
						.setAttribute("user", user1);
				return SUCCESS;

			} 
		}
		
		
		if(person.equals("seller")){
			Seller seller = new Seller();
			seller.setName(name);
			seller.setPassword(password);
			
			Seller s = userService.login(seller);
			if (s!= null) {
				ServletActionContext.getRequest().getSession().setAttribute("seller", s);
			}
			return SUCCESS;
		}
		
		return INPUT;
		
	}
	
	
	/*
	 * 3銆佷慨鏀瑰瘑纰�
	 */
	
	private String newpassword;
	
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String updatePwd(){
		
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User)session.getAttribute("user");
		if(user.getPassword().equals(password)){
			if(newpassword.equals(repassword)){
				userService.updatePwd(user,newpassword);
				
				return "update_sucess";
			}
		}
		
		return "update";
		
	}
	
	/*
	 * 4銆侀�鍑�
	 */
	public String exit(){
			
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.invalidate();
			
				return "exit";
		}
	
	/*
	 * 5銆佸繕璁板瘑鐮�
	 */
	
	@SuppressWarnings("all")
	public String forgetPwd(){
		User user = new User();
		user.setName(name);
		user.setTelnum(telnum);
		User u = userService.forgetPwd(user);
		ServletActionContext.getRequest().getSession().setAttribute("u", u);
		if(u!=null){
			return "rePassword";
		}
		else {
			return "forgetPwd";
		}
	}
	
	public String rePassword(){
		 //int userId = Integer.parseInt(ServletActionContext.getRequest().getParameter("userId"));
		 User user = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		 System.out.println("鏂板瘑鐮侊細"+newpassword);
		 System.out.println("纭瀵嗙爜锛�"+repassword);
		 if(newpassword.equals(repassword)){
			 userService.updatePwd(user, newpassword);
				return "rePassword_sucess";
		 }
		 else {
			return "rePassword_fail";
		}
		
	}

	
	

}
