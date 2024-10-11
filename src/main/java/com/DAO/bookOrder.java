package com.DAO;

import java.util.List;

import com.entity.bookOrders;

public interface bookOrder {

		public boolean saveOrders(List<bookOrders> b);

		public List<bookOrders> getAllOrders(String email);

		public List<bookOrders> AllOrders();
}
