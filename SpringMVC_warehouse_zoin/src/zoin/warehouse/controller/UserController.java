package zoin.warehouse.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hznu.grade15x.MD5utils.MD5;
import hznu.grade15x.QRCode.QRCodeUtil;
import hznu.grade15x.utils.GetRandomString;
import hznu.grade15x.utils.GoogleValidate;
import zoin.warehouse.email.MailSenderInfo;
import zoin.warehouse.email.SimpleMailSender;
import zoin.warehouse.entity.User;
import zoin.warehouse.service.ICntTimeService;
import zoin.warehouse.service.IUserService;




/*
 * 控制用户操作的controller
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICntTimeService cntTimeService;
	
	//根据传入的盐值计算MD5的次数
	public int getCntBySalt(String salt){
		return ((int)(Long.parseLong(salt)%100))+1;
	}
	
	//登陆
	@RequestMapping("/login")
	public String login(User user,String pwd,HttpServletRequest request){
		System.out.println("login----------");
		List<User> allUser = userService.getAllUser();
		User myUser=null;
		boolean flag=false;
		for (User cur : allUser) {
			if(cur==null) continue;
			if(cur.getUserName().equals(user.getUserName())){
				int cnt=getCntBySalt(cur.getSalt());
				for(int i=0;i<cnt;i++)
					pwd=MD5.stringMD5(pwd);
				if(pwd.equals(cur.getMD5())){
					myUser=cur;
					flag=true;break;
				}
			}
		}
		if(flag){
			HttpSession session = request.getSession();
			if(myUser.getOpenGoogleValidate()==1){
				session.setAttribute("user", myUser);
				//验证成功，开启谷歌身份验证的情况下
				return "admin/user/googleValidate";
			}
			else{
				session.setAttribute("user", myUser);
				//验证成功，没开启身份验证
				return "admin/good/index";
			}
		}
		else{
			//验证失败
			request.setAttribute("message", "用户名或密码错误!");
			return "admin/user/login";
		}
	}
	
	//退出用户
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "admin/user/login";
	}
	
	//重置密码
	@RequestMapping("/reset")
	public String reset(String email){
		List<User> users = userService.getAllUser();
		for (User user : users){
			if(user.getEmail().equals(email)){
				String initial="111111";
				int cnt=getCntBySalt(user.getSalt());
				System.out.println(cnt+"---------"+"cnt");
				for(int i=0;i<cnt;i++){
					initial=MD5.stringMD5(initial);
				}
				System.out.println();
				user.setMD5(initial);
				userService.updateUser(user);
				break;
			}
		}
		
        //这个类主要是设置邮件  
	    MailSenderInfo mailInfo = new MailSenderInfo();   
	    mailInfo.setMailServerHost("smtp.163.com");   
	    mailInfo.setMailServerPort("25");   
	    mailInfo.setValidate(true);   
	    mailInfo.setUserName("a376712116@163.com");   
	    mailInfo.setPassword("hello123");//您的邮箱密码(授权码)   
	    
	    mailInfo.setFromAddress("a376712116@163.com");   
	    mailInfo.setToAddress(email);   
	    mailInfo.setSubject("重置密码");   
	    mailInfo.setContent("您好，您的仓库管理系统的密码已经重置为111111");   
	    //这个类主要来发送邮件  
	    SimpleMailSender sms = new SimpleMailSender();  
	    sms.sendTextMail(mailInfo);//发送文体格式   
	    return "admin/user/login";		 
	}
	
	//前往添加用户页面
//	@RequestMapping("/toaddUser")
//	public String toAddUser()
//	{
//		return "addUser";
//	}
	
	//前往google验证页面
	@RequestMapping("/toGoogle")
	public String toGoogle()
	{
		return "admin/user/googleValidate";
	}
	

	//google验证
	@RequestMapping("/googleValidate")
	public String googleValidate(String code,HttpServletRequest request) throws Exception
	{
		User user =(User) request.getSession().getAttribute("user");
		//获取当前用户在服务器端的动态密码
		String serverCode=GoogleValidate.getValidateCode(user.getSecretKey());
		System.out.println("Server code--------------"+serverCode);
		System.out.println("input code--------------"+code);
		//验证成功
		if(serverCode.equals(code)){
			return "redirect:/good/toIndex";
		}
		//失败
		else{
			request.setAttribute("message", "动态密码错误！");
			return "admin/user/googleValidate";
		}
	}
	
	//ajax验证用户名是否可用
	@RequestMapping("/validateUsername")
	public void validateNameAdd(String name,HttpServletRequest request,HttpServletResponse response)
	{	
		
		try {
			PrintWriter pw = response.getWriter();
			List<User> users = userService.getAllUser();
			boolean flag=false;
			for (User user : users) {
				if(user.getUserName().equals(name)){
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
	
	//添加一个用户
	@RequestMapping("/addUser")
	public String addUser(User user,String password,HttpServletRequest request)
	{	
		try {
			//随机生成盐值
			String salt=GetRandomString.getRandomString(16);
			user.setSalt(salt);
			//计算次数
			int cnt=getCntBySalt(salt);
			System.out.println("----"+cnt);
			System.out.println("angry------"+password);
			for(int i=0;i<cnt;i++){
				password=MD5.stringMD5(password);
			}
			//设置加密后的密文MD5
			user.setMD5(password);
			System.out.println("finally---"+password);
			//设置google validate 的密钥
			String seed=GetRandomString.getRandomString(16);
			//创建google验证的密钥
			String secretKey=GoogleValidate.createCredentials(seed);
			user.setSecretKey(secretKey);
			
			userService.addUser(user);
			//构造二维码
			createQRCode(user,request);
			
			request.getSession().setAttribute("user", user);
			
			System.out.println("complete1111!!!");
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			return "/admin/user/first_googleValidate";
		}
	}
	
	//得到所有用户
	@RequestMapping("/getalluser")
	public String getAllUser(User user,HttpServletRequest request)
	{
		List<User> userlist = userService.getAllUser();
		request.setAttribute("userlist", userlist);
		return "usermanager";
	}
	
	//ajax请求改变用户是否决定开启google身份验证
	@RequestMapping("/changeGoogleValidate")
	@ResponseBody
	public String changeGoogleValidate(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");
		if(user.getOpenGoogleValidate()==0)
			user.setOpenGoogleValidate(1);
		else
			user.setOpenGoogleValidate(0);
		userService.updateUser(user);
		session.setAttribute("user", user);
		return "success";
	}
	
	
	
	//创建二维码
	public void createQRCode(User user,HttpServletRequest request) throws Exception{
		//生成对应id的二维码并且保存在QRCode目录下，文件名为id.jpg
		//特别要注意这里这里二维码不仅要存在项目workspace的目录下，而且在apache部署项目的目录下也要直接存，不然要刷新项目才能显示图片
		//通过request.getSession().getServletContext().getRealPath("/")得到部署项目的目录
		//先把生成的图片放到apache的部署目录，同时用IO流将图片放到当前项目目录下
			
		
		//我的apache部署项目的目录 D:\WEB_ADDRESS\wtpwebapps\InfoSafe\
	    String apachePath=request.getSession().getServletContext().getRealPath("/");
		String basePath=apachePath+"admin\\QRCode";
		System.out.println("basepath---------"+basePath);
//		String url="otpauth://totp/Google%3Ayourname@gmail.com?secret="+secretKey+"&issuer=Google";
		String url="otpauth://totp/Google%3A"+user.getUserName()+"@gmail.com?secret="+user.getSecretKey()+"&issuer=Google";

		
		//二维码的logo图片所在地址
		String logoPath=basePath+"//qq.png";
		//保存图片的id
		QRCodeUtil.id=user.getId()+"";
		//生成二维码 url->二维码的url链接  logopath-->logo图片所在的地址  basePath-->存放二维码的文件夹 true-->压缩二维码
		QRCodeUtil.encode(url, logoPath, basePath, true);
		
		
		
		/*
		 * IO流操作将apache部署目录下的图片复制到项目目录的QRCode下
		 */
		//本地工程目录，根据实际修改
		
		String projectPath="C://Users//泽林//Desktop//j2eework//SpringMVC_Spring_Hibernate_Final-master2//SpringMVC_Spring_Hibernate_Final-master//WebContent//admin";
		
		String localPath=projectPath+"//QRCode";
		File file=new File(localPath+"//qq.png");
		//如果本地路径改对了 能够找到文件
		if(file.exists()){
			/*
			 * IO流复制
			 */
			System.out.println("ready to copy..........");
			InputStream in=new FileInputStream(new File(basePath+"//"+user.getId()+".jpg"));
			OutputStream out=new FileOutputStream(new File(localPath+"//"+user.getId()+".jpg"));
			byte[] buffer=new byte[1024*10];
			int len=0;
			while((len=in.read(buffer))!=-1){
				out.write(buffer);
			}
			in.close();
			out.close();
		}
	}
}
