package zoin.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zoin.warehouse.dao.IGoodDao;
import zoin.warehouse.entity.Good;
import zoin.warehouse.entity.Repository;
import zoin.warehouse.service.IGoodService;
/*
 * 操作货物的service
 */
@Service
public class GoodService implements IGoodService{
	
	@Autowired
	private IGoodDao goodDao;

	//增加货物
	@Override
	public void addGood(Repository repo,Good good) {
		repo.getGoods().add(good);
		good.setRepository(repo);
		goodDao.save(good);
	}

	//所有货物
	@Override
	public List<Good> getAllGood() {
		return goodDao.findAll(Good.class);
	}

	//删除指定id货物
	@Override
	public void deleteGood(int id) {
		goodDao.delete(Good.class, id);
	}

	//根据id得到对应货物
	@Override
	public Good getSingleGood(int id) {
		return goodDao.get(Good.class, id);
	}

	//更新一个货物
	@Override
	public void updateGood(Good good) {
		goodDao.update(good);
	}

}
