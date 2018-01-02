package zoin.warehouse.service;

import java.util.List;

import zoin.warehouse.entity.InAndOutTime;
import zoin.warehouse.entity.User;
/*
 * 操作次数的接口
 */
public interface ICntTimeService {

	public void add(InAndOutTime inAndOutTime);
	
	public List<InAndOutTime> getAll();
	
	public void delete(int id);
	
	public User getSingle(int id);
	
	public void update(InAndOutTime inAndOutTime);
	
	public User getByName(String name);
	
	
}
