package zoin.warehouse.service;

import java.util.List;

import zoin.warehouse.entity.Good;
import zoin.warehouse.entity.Repository;
/*
 * 操作货物的service接口
 */
public interface IGoodService {

	public void addGood(Repository repo,Good good);
	
	public List<Good> getAllGood();
	
	public void deleteGood(int id);
	
	public Good getSingleGood(int id);
	
	public void updateGood(Good good);
	
}
