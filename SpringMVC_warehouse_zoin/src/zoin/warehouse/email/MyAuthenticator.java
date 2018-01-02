package zoin.warehouse.email;


  
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;  
    
public class MyAuthenticator extends Authenticator{  
    String userName=null;  
    String password=null;  
       
    public MyAuthenticator(){  
    }  
    public MyAuthenticator(String username, String password) {   
        this.userName = username;   
        this.password = password;   
    }   
    protected PasswordAuthentication getPasswordAuthentication(){  
        return new PasswordAuthentication(userName, password);  
    }  
    
    public static void main(String[] args){  
    //测试
        //这个类主要是设置邮件  
     MailSenderInfo mailInfo = new MailSenderInfo();   
     mailInfo.setMailServerHost("smtp.163.com");   
     mailInfo.setMailServerPort("25");   
     mailInfo.setValidate(true);   
     mailInfo.setUserName("a376712116@163.com");   
     mailInfo.setPassword("hello123");//您的邮箱密码   
     mailInfo.setFromAddress("a376712116@163.com");   
     mailInfo.setToAddress("376712116@qq.com");   
     mailInfo.setSubject("重置密码");   
     mailInfo.setContent("您好，您的仓库管理系统的密码已经重置为111111");   
        //这个类主要来发送邮件  
     SimpleMailSender sms = new SimpleMailSender();  
         sms.sendTextMail(mailInfo);//发送文体格式   
         sms.sendHtmlMail(mailInfo);//发送html格式  
   }  
    
}  