package zoin.warehouse.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*
 * 货物实体类
 */
@Entity
@Table(name="tb_goods")
public class Good
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "good_id")
    private int id;
    private String name;
    private int isDelete=0;
	private String price;
	private int number;
	private String supplier;
	private String area;//地域
	private String supplierPhone;
	private String manufactureDate;//生产日期
	

	public String getManufactureDate() {
		return manufactureDate;
	}
	public void setManufactureDate(String manufactureDate) {
		this.manufactureDate = manufactureDate;
	}
	public String getSupplierPhone() {
		return supplierPhone;
	}
	public void setSupplierPhone(String supplierPhone) {
		this.supplierPhone = supplierPhone;
	}
	//双向1:N 关联关系
	@ManyToOne(targetEntity = Repository.class)
	@JoinColumn(name = "repository_id", referencedColumnName = "repository_id", nullable = false)
    private Repository repository;
	
    public Repository getRepository() {
		return repository;
	}
	public void setRepository(Repository repository) {
		this.repository = repository;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Good() {
		// TODO Auto-generated constructor stub
	}
    public Good(String name) {
    	this.name=name;
    }
    
    
    public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

 

    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    @Override
    public boolean equals(Object obj) {
    	Good tmp = (Good) obj;
    	return getId()==tmp.getId();
    }
    
}
