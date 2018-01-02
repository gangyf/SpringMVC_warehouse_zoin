package zoin.warehouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import zoin.warehouse.entity.Good;
import zoin.warehouse.entity.Repository;
import zoin.warehouse.service.ICntTimeService;
import zoin.warehouse.service.IGoodService;
import zoin.warehouse.service.IRepoService;
/*
 * 控制货物操作的controller
 */
@Controller
@RequestMapping("/good")
public class GoodController {
	@Autowired
	private IGoodService goodService;
	
	@Autowired
	private IRepoService repoService;
	
	@Autowired
	private ICntTimeService cntTimeService;
	
	//前往增加货物页面
	@RequestMapping("/toadd")
	public String toAdd(HttpServletRequest request)
	{
		List<Repository> repolist = repoService.getAllRepo();
		request.setAttribute("repolist", repolist);
		return "/admin/good/add_good";
	}
	
	//前往登陆后系统的主页
	@RequestMapping("/toIndex")
	public String toIndex(){
		return "admin/good/index";
	}
	
	//添加一个货物
	@RequestMapping("/add")
	public String add(Good good,int repoID,HttpServletRequest request)
	{	
		Repository repo = repoService.getSingleRepo(repoID);
		//判断该仓库中是否有该货物
		List<Good> goods = repo.getGoods();
		for (Good tmp : goods) {
			if(tmp.getName().equals(good.getName())){
				int addNumber=good.getNumber();
				tmp.setNumber(tmp.getNumber()+addNumber);
				repo.setGoods(goods);
				goodService.updateGood(tmp);
				return "redirect:/good/getall";
			}
		}
		
		goodService.addGood(repo,good);
		//SpringMVC重定向到获取所有货物
		return "redirect:/good/getall";
	}
	
	//获取所有货物并显示
	@RequestMapping("/getall")
	public String getAll(Good good,HttpServletRequest request)
	{	
		List<Repository> repolist = repoService.getAllRepo();
		request.setAttribute("repolist", repolist);
		return "admin/good/list_goods";
	}
	
	//根据id删除一个货物
	@RequestMapping("/delete")
	public String delete(int id,HttpServletRequest request ,HttpServletResponse response)
	{
		goodService.deleteGood(id);
		return "redirect:/good/getall";
	}
	
	//前往编辑货物页面
	@RequestMapping("/toedit")
	public String toedit(int id,HttpServletRequest request)
	{
		Good good = goodService.getSingleGood(id);
		List<Repository> repolist = repoService.getAllRepo();
		request.setAttribute("repolist", repolist);
		request.setAttribute("good", good);
		System.out.println(good);
		return "admin/good/edit_good";
	}
	
	//更新一个货物
	@RequestMapping("/update")
	public String update(Good good,HttpServletRequest request)
	{	
		int repoID=Integer.parseInt(request.getParameter("repoID"));
		Repository repo = repoService.getSingleRepo(repoID);
		good.setRepository(repo);
		goodService.updateGood(good);
		return "redirect:/good/getall";
	}
	
	//前往出库页面
	@RequestMapping("/toout")
	public String toout(int id,HttpServletRequest request)
	{
		Good good = goodService.getSingleGood(id);
		request.setAttribute("good", good);
		return "admin/good/out_good";
	}
	
	//出库操作
	@RequestMapping("/out")
	public String out(int id,HttpServletRequest request)
	{
		Good good = goodService.getSingleGood(id);
		int outNumber=Integer.parseInt(request.getParameter("outnumber"));
		good.setNumber(good.getNumber()-outNumber);
		goodService.updateGood(good);
		return "redirect:/good/getall";
	}
	
	
	//ajax验证货物名是否存在（根据同一仓库中货物名字判断）
	@RequestMapping("/validateName")
	public void validateName(String name,int repoID,int goodID,HttpServletRequest request,HttpServletResponse response)
	{	
		try {
			PrintWriter pw = response.getWriter();
			Repository repo = repoService.getSingleRepo(repoID);
			List<Good> goods = repo.getGoods();
			boolean flag=false;
			for (Good good : goods) {
				if(good.getId()==goodID)
					continue;
				if(good.getName().equals(name)){
					flag=true;break;
				}
			}
			if (flag) {
				pw.print("exist");
			}
			else
				pw.print("none");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//添加货物的时候ajax验证货物名
	@RequestMapping("/validateNameAdd")
	public void validateNameAdd(String name,int repoID,HttpServletRequest request,HttpServletResponse response)
	{	
		try {
			PrintWriter pw = response.getWriter();
			
			Repository repo = repoService.getSingleRepo(repoID);
			List<Good> goods = repo.getGoods();
			boolean flag=false;
			for (Good good : goods) {
				if(good.getName().equals(name)){
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
