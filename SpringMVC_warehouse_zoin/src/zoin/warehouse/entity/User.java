package zoin.warehouse.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 用户实体类
 */
@Entity
@Table(name="tb_user")
public class User {

	//声明主键
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String userName;
	private String email;
//	private String pwd;
	private String salt;//盐值
	private String MD5;//保存在服务器的密文
	private String secretKey;//谷歌身份验证器的密钥
	private int openGoogleValidate=1;//是否打开谷歌身份验证
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getMD5() {
		return MD5;
	}
	public void setMD5(String mD5) {
		MD5 = mD5;
	}
	public String getSecretKey() {
		return secretKey;
	}
	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	public int getOpenGoogleValidate() {
		return openGoogleValidate;
	}
	public void setOpenGoogleValidate(int openGoogleValidate) {
		this.openGoogleValidate = openGoogleValidate;
	}
	
}
