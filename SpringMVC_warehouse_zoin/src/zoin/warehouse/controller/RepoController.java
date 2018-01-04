package zoin.warehouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zoin.warehouse.entity.Good;
import zoin.warehouse.entity.Repository;
import zoin.warehouse.entity.User;
import zoin.warehouse.service.IRepoService;
import zoin.warehouse.service.IUserService;
/*
 * 控制仓库操作的controller
 */
@Controller
@RequestMapping("/repo")
public class RepoController {
	@Autowired
	private IRepoService repoService;
	
	//前往增加页面
	@RequestMapping("/toadd")
	public String toAddUser()
	{
		return "admin/repo/add_repo";
	}
	
	//增加一个仓库
	@RequestMapping("/add")
	public String addRepo(Repository repo)
	{
		repoService.addRepo(repo);
		return "redirect:/repo/getall";
	}
	
	//得到所有仓库
	@RequestMapping("/getall")
	public String getAllRepo(Repository repository,HttpServletRequest request)
	{
		List<Repository> repos = repoService.getAllRepo();
		request.setAttribute("repolist", repos);
		return "admin/repo/list_repos";
	}
	
	@RequestMapping("/delete_okornot")
	@ResponseBody
	public void deleteRepookornot(int id,HttpServletRequest request ,HttpServletResponse response){
		Repository repo = repoService.getSingleRepo(id);
		try {
			PrintWriter pw = response.getWriter();
			if(repo.getGoods()!=null&&repo.getGoods().size()!=0){
				pw.print("fail");
			}
			else{
				pw.print("success");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	//根据id删除一个仓库
	@RequestMapping("/delete")
	public String deleteRepo(int id,HttpServletRequest request ,HttpServletResponse response)
	{	
		try {
			repoService.deleteRepo(id);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "redirect:/repo/getall";
	}
	
	//前往编辑页面
	@RequestMapping("/toedit")
	public String toeditRepo(int id,HttpServletRequest request)
	{	
		Repository repository=repoService.getSingleRepo(id);
		request.setAttribute("repo", repository);
		return "admin/repo/edit_repo";
	}
	
	//更新一个仓库的信息
	@RequestMapping("/update")
	public String updateRepo(Repository repo,HttpServletRequest request)
	{	
		repoService.updateRepo(repo);
		System.out.println("update ok---!");
		return "redirect:/repo/getall";
	}
	
	//前往查看一个指定id的仓库
	@RequestMapping("/repo_goods")
	public String repoGoods(int id,HttpServletRequest request)
	{	
		Repository repo = repoService.getSingleRepo(id);
		request.setAttribute("repo", repo);
		return "admin/good/repo_goods";
	}
	
	//验证仓库名是否可用
	@RequestMapping("/validateName")
	public void validateName(String name,int goodID,HttpServletRequest request,HttpServletResponse response)
	{	
		try {
			PrintWriter pw = response.getWriter();
			List<Repository> repos = repoService.getAllRepo();
			boolean flag=false;
			for (Repository repo : repos) {
				if(repo.getId()==goodID)
					continue;
				if(repo.getRepositoryName().equals(name)){
					flag=true;break;
				}
			}
			if (flag) {
				pw.print("exist");
			}
			else
				pw.print("none");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//添加的时候验证仓库名
	@RequestMapping("/validateNameAdd")
	public void validateName(String name,HttpServletRequest request,HttpServletResponse response)
	{	
		
		try {
			PrintWriter pw = response.getWriter();
			
			List<Repository> repos = repoService.getAllRepo();
			boolean flag=false;
			for (Repository repo : repos) {
				if(repo.getRepositoryName().equals(name)){
					flag=true;break;
				}
			}
			if (flag) {
				pw.print("exist");
			}
			else
				pw.print("none");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
