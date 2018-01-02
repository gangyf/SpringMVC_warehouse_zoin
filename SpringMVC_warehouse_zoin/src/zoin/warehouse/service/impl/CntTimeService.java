package zoin.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zoin.warehouse.dao.ICntTimeDao;
import zoin.warehouse.entity.InAndOutTime;
import zoin.warehouse.entity.User;
import zoin.warehouse.service.ICntTimeService;
/*
 * 统计次数的service
 */
@Service
public class CntTimeService implements ICntTimeService{

	@Autowired
	private ICntTimeDao cntTimeDao;
	

	public ICntTimeDao getCntTimeDao() {
		return cntTimeDao;
	}

	public void setCntTimeDao(ICntTimeDao cntTimeDao) {
		this.cntTimeDao = cntTimeDao;
	}
	
	@Override
	public void add(InAndOutTime inAndOutTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<InAndOutTime> getAll() {
		return cntTimeDao.findAll(InAndOutTime.class);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getSingle(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(InAndOutTime inAndOutTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	


	

}
