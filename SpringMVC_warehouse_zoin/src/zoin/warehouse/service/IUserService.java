package zoin.warehouse.service;

import java.util.List;

import zoin.warehouse.entity.User;
/*
 * 操作User的service接口
 */
public interface IUserService {

	public void addUser(User user);
	
	public List<User> getAllUser();
	
	public void deleteUser(int id);
	
	public User getSingleUser(int id);
	
	public void updateUser(User user);
	
	public User getUserByName(String name);
	
	
}
