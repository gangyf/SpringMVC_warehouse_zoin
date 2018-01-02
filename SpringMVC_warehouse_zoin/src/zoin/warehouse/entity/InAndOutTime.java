package zoin.warehouse.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_statis_in_out")
public class InAndOutTime {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	int inNumber=0;
	int outNumber=0;
	Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInNumber() {
		return inNumber;
	}
	public void setInNumber(int inNumber) {
		this.inNumber = inNumber;
	}
	public int getOutNumber() {
		return outNumber;
	}
	public void setOutNumber(int outNumber) {
		this.outNumber = outNumber;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
