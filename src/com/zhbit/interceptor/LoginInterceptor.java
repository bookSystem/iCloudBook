package com.zhbit.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {
//测试文字
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		Object object = ServletActionContext.getRequest().getSession().getAttribute("user");
		if(object != null){
			return arg0.invoke();
		}
		else {
			
			return "login";
		}
	}

}
