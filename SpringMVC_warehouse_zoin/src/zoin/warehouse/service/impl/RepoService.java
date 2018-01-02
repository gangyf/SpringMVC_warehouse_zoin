package zoin.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zoin.warehouse.dao.IRepoDao;
import zoin.warehouse.entity.Repository;
import zoin.warehouse.service.IRepoService;
/*
 * 操作仓库的service
 */
@Service
public class RepoService implements IRepoService{
	
	@Autowired
	private IRepoDao repoDao;

	//增加仓库
	@Override
	public void addRepo(Repository repository) {
		repoDao.save(repository);
	}

	//得到所有仓库
	@Override
	public List<Repository> getAllRepo() {
		return repoDao.findAll(Repository.class);
	}

	//删除对应id仓库
	@Override
	public void deleteRepo(int id) {
		repoDao.delete(Repository.class, id);
	}

	//得到对应id仓库
	@Override
	public Repository getSingleRepo(int id) {

		return repoDao.get(Repository.class, id);
	}

	//更新一个仓库
	@Override
	public void updateRepo(Repository repo) {
		repoDao.update(repo);
	}
	

}
