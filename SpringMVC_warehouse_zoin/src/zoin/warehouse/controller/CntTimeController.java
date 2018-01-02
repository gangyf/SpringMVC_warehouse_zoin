package zoin.warehouse.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zoin.warehouse.dao.ICntTimeDao;
import zoin.warehouse.entity.InAndOutTime;
import zoin.warehouse.entity.Repository;
import zoin.warehouse.service.ICntTimeService;
import zoin.warehouse.service.IRepoService;
/*
 * 统计出库入库次数的controller
 */
@Controller
public class CntTimeController {
	
	@Autowired
	private ICntTimeService cntTimeService;
	
	//ajax请求后台获取统计出库入库次数数据
	@RequestMapping("/allTimes")
	@ResponseBody
	public String allTime(HttpServletRequest request)
	{
		List<InAndOutTime> all = cntTimeService.getAll();
		List in=new ArrayList<>();
		List out=new ArrayList<>();
		List time=new ArrayList<>();
		
		for (InAndOutTime inAndOutTime : all) {
			in.add(inAndOutTime.getInNumber());
			out.add(inAndOutTime.getOutNumber());
			time.add(inAndOutTime.getDate().getTime());
		}
		//手动拼接json
		return "{\"innum\":"+in+",\"outnum\":"+out+",\"time\":"+time+"}";
	}
	
	
	
}
