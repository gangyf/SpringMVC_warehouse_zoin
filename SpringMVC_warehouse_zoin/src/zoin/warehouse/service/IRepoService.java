package zoin.warehouse.service;

import java.util.List;

import zoin.warehouse.entity.Repository;
/*
 * 操作仓库的service接口
 */
public interface IRepoService {
	public void addRepo(Repository repository);
	
	public List<Repository> getAllRepo();
	
	public void deleteRepo(int id);
	
	public Repository getSingleRepo(int id);
	
	public void updateRepo(Repository user);
}
