package zoin.warehouse.dao.impl;

import org.springframework.stereotype.Repository;

import zoin.warehouse.dao.ICntTimeDao;
import zoin.warehouse.entity.InAndOutTime;
//操作统计次数的dao
@Repository
public class CntTimeDao extends BaseDaoHibernate4<InAndOutTime> implements ICntTimeDao{
	


}
