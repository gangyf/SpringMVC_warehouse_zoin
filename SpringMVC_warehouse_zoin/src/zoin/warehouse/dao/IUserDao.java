package zoin.warehouse.dao;

import java.util.List;

import org.crazyit.common.dao.BaseDao;

import zoin.warehouse.entity.User;

public interface IUserDao extends BaseDao<User>{
	
	public User getUserByName(String name);
}
