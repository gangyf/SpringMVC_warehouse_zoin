package zoin.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import zoin.warehouse.dao.IUserDao;
import zoin.warehouse.entity.User;
import zoin.warehouse.service.IUserService;
/*
 * 操作用户的service
 */
@Service
public class UserService implements IUserService{
	
	@Autowired
	private IUserDao userDao;
	
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	//增加用户
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("save user");
		userDao.save(user);
		
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		System.out.println("find all user");
		return userDao.findAll(User.class);
	}

	//删除指定id用户
	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		System.out.println("delete user");
		userDao.delete(User.class,id);

	}
	
	//得到对应id用户
	@Override
	public User getSingleUser(int id) {
		System.out.println("get single");
		return userDao.get(User.class, id);
	}

	//更新一个用户
	@Override
	public void updateUser(User user) {
		System.out.println("update------");
		userDao.update(user);
	}

	//根据用户名得到用户
	@Override
	public User getUserByName(String name) {
		User user = userDao.getUserByName(name);
		return user;
	}
	
	

}
