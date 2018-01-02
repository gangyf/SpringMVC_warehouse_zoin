package zoin.warehouse.dao.impl;

import org.springframework.stereotype.Repository;

import zoin.warehouse.dao.IGoodDao;
import zoin.warehouse.entity.Good;
//操作good的dao
@Repository
public class GoodDao extends BaseDaoHibernate4<Good> implements IGoodDao{
	

}
