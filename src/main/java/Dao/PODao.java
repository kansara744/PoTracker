package Dao;

import java.io.File;
import java.sql.Date;

public class PODao {

	private int poid;
	private int projectid;
	private String potype;
	private String ponumber;
	private Date podate;
	private String amount;
	private Date startdate;
	private Date enddate;
	private String hrcost;
	private String thirdpartycost;
	private String wbscode;
	private String pofile;
	private Date createdate;
	private Date modifydate;
	private String modifyby;
	private String projectname;
	
	
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public int getPoid() {
		return poid;
	}
	public void setPoid(int poid) {
		this.poid = poid;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public String getPotype() {
		return potype;
	}
	public void setPotype(String potype) {
		this.potype = potype;
	}
	public String getPonumber() {
		return ponumber;
	}
	public void setPonumber(String ponumber) {
		this.ponumber = ponumber;
	}
	public Date getPodate() {
		return podate;
	}
	public void setPodate(Date podate) {
		this.podate = podate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getHrcost() {
		return hrcost;
	}
	public void setHrcost(String hrcost) {
		this.hrcost = hrcost;
	}
	public String getThirdpartycost() {
		return thirdpartycost;
	}
	public void setThirdpartycost(String thirdpartycost) {
		this.thirdpartycost = thirdpartycost;
	}
	public String getWbscode() {
		return wbscode;
	}
	public void setWbscode(String wbscode) {
		this.wbscode = wbscode;
	}
	public String getPofile() {
		return pofile;
	}
	public void setPofile(String pofile) {
		this.pofile = pofile;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	public String getModifyby() {
		return modifyby;
	}
	public void setModifyby(String modifyby) {
		this.modifyby = modifyby;
	}
	@Override
	public String toString() {
		return "PODao [poid=" + poid + ", projectid=" + projectid + ", potype=" + potype + ", ponumber=" + ponumber
				+ ", podate=" + podate + ", amount=" + amount + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", hrcost=" + hrcost + ", thirdpartycost=" + thirdpartycost + ", wbscode=" + wbscode + ", pofile="
				+ pofile + ", createdate=" + createdate + ", modifydate=" + modifydate + ", modifyby=" + modifyby
				+ ", projectname=" + projectname + "]";
	}
	
	
}
