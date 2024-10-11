package com.DAO;

import com.entity.User;

public interface userDAO {

	public int userRegister(User us);

	public User login(String email,String pwd);

	public boolean checkPassword(String password,int uid);

	public boolean updateUser(User us);

	public boolean updateAddress(User u,int uid);

	public int changepwd(int id,String newpwd,String old);
}
