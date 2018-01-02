package zoin.warehouse.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import zoin.warehouse.dao.IUserDao;
import zoin.warehouse.entity.User;
//操作用户的dao
@Repository
public class UserDao extends BaseDaoHibernate4<User> implements IUserDao{
	

	public List<User> find(String hql) {
		return super.find(hql);
	}
	@Override
	public User getUserByName(String name) {
		String hql="from User u where u.userName="+name;
		List<User> users = super.find(hql);
		return users.get(0);
	}

}
