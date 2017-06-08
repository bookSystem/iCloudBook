package com.zhbit.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.OrderDao;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.User;

@Transactional
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDao orderDao;

	@SuppressWarnings("unchecked")
	@Override
	public void orderAdd(String address) {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<Book> shoppingBook = (List<Book>)session.getAttribute("checkBook");
		double totalMoney =(Double)session.getAttribute("checkMoney");
		User user = (User)session.getAttribute("user");
		Order order = new Order();
		order.setAddress(address);
		order.setUser(user);
		Date date=new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String time=format1.format(date);
		order.setOrderTime(time);
		//order.setOrderTime(new Timestamp(System.currentTimeMillis()));
		order.setIsDeal("0");
		order.setTotal(totalMoney);
		String orderNumber = "DDBH";
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(100000);
		orderNumber += formatDate+random;
		order.setOrderNumber(orderNumber);
		int orderId = orderDao.orderAdd(order);//生成订单
		Order newOrder = orderDao.findOrder(orderId);
		for(Book book:shoppingBook){
			OrderItem orderItem = new OrderItem();
			orderItem.setBook(book);
			orderItem.setQuantity(book.getBookNum());
			orderItem.setOrder(newOrder);
			orderDao.orderItemAdd(orderItem);
		}
		
		session.removeAttribute("shoppingBook");
		session.removeAttribute("totalMoney");
	}

	
	@Override
	public void addPay(String address) {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		Book book = (Book)session.getAttribute("paybook");
		int number = (Integer) session.getAttribute("num");
		double totalPrice = book.getBookPrice()*number;
		User user = (User)session.getAttribute("user");
		Order order = new Order();
		order.setAddress(address);
		order.setUser(user);
		Date date=new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String time=format1.format(date);
		order.setOrderTime(time);
		order.setIsDeal("0");
		order.setTotal(totalPrice);
		String orderNumber = "DDBH";
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(100000);
		orderNumber += formatDate+random;
		order.setOrderNumber(orderNumber);
		int orderId = orderDao.orderAdd(order);//生成订单
		Order newOrder = orderDao.findOrder(orderId);
		OrderItem orderItem = new OrderItem();
		orderItem.setBook(book);
		orderItem.setQuantity(number);
		orderItem.setOrder(newOrder);
		orderDao.orderItemAdd(orderItem);
		
	}
	
	
	@Override
	public List<Order> myOrderList(int userId) {
		// TODO Auto-generated method stub
		return orderDao.myOrderList(userId);
	}

	@Override
	public Order oneOrder(int orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrder(orderId);
	}

	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.updateOrder(order);
	}

	


}
