package Dao;

import java.sql.Date;
import java.sql.Timestamp;


public class ProjectDao {

	private int projectid;
	private String projectname;
	private String version;
	private Date handoverdate;
	private String city;
	private String country;
	private String customername;
	private String customerno;
	private String operationmanager;
	private String technicalmanager;
	private String accountmanager;
	private String deliverymanager;
	private String modifyby;
	private Date createdate;
	private Date modifydate;
	private String closedflag;
	private String supporttype;
	
	
	 
	
	public String getSupporttype() {
		return supporttype;
	}
	public void setSupporttype(String supporttype) {
		this.supporttype = supporttype;
	}
	public String getClosedflag() {
		return closedflag;
	}
	public void setClosedflag(String closedflag) {
		this.closedflag = closedflag;
	}
	public Date getHandoverdate() {
		return handoverdate;
	}
	public void setHandoverdate(Date handoverdate) {
		this.handoverdate = handoverdate;
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
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getCustomerno() {
		return customerno;
	}
	public void setCustomerno(String customerno) {
		this.customerno = customerno;
	}
	public String getOperationmanager() {
		return operationmanager;
	}
	public void setOperationmanager(String operationmanager) {
		this.operationmanager = operationmanager;
	}
	public String getTechnicalmanager() {
		return technicalmanager;
	}
	public void setTechnicalmanager(String technicalmanager) {
		this.technicalmanager = technicalmanager;
	}
	public String getAccountmanager() {
		return accountmanager;
	}
	public void setAccountmanager(String accountmanager) {
		this.accountmanager = accountmanager;
	}
	public String getDeliverymanager() {
		return deliverymanager;
	}
	public void setDeliverymanager(String deliverymanager) {
		this.deliverymanager = deliverymanager;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getModifyby() {
		return modifyby;
	}
	public void setModifyby(String modifyby) {
		this.modifyby = modifyby;
	}
	
	@Override
	public String toString() {
		return "ProjectDao [projectid=" + projectid + ", projectname=" + projectname + ", version=" + version
				+ ", handoverdate=" + handoverdate + ", city=" + city + ", country=" + country + ", customername="
				+ customername + ", customerno=" + customerno + ", operationmanager=" + operationmanager
				+ ", technicalmanager=" + technicalmanager + ", accountmanager=" + accountmanager + ", deliverymanager="
				+ deliverymanager + ", modifyby=" + modifyby + ", createdate=" + createdate + ", modifydate="
				+ modifydate + "]";
	}
	
}
