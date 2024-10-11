package com.DAO;

import java.util.List;

import com.entity.cart;

public interface cartDAO {
	public int addCart(cart c);

	public List<cart> getallCart(int uid);

	public boolean deleteBook(int bid,int uid);

	public boolean addQuantity(int bid,int uid);

	public boolean deleteallCartBooks(int uid);
}
