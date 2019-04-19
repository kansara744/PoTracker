package Dao;

import java.sql.Date;

public class GovernanceDao {

	private int gvid;
	private int projectid;
	private String projectname;
	private Date calldate;
	private String participantsnames;
	private String mom;
	private Date createdate;
	private Date modifydate;
	private String modifyby;
	private String doctype;
	private String subject;
	public int getGvid() {
		return gvid;
	}
	public void setGvid(int gvid) {
		this.gvid = gvid;
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
	public Date getCalldate() {
		return calldate;
	}
	public void setCalldate(Date calldate) {
		this.calldate = calldate;
	}
	public String getParticipantsnames() {
		return participantsnames;
	}
	public void setParticipantsnames(String participantsnames) {
		this.participantsnames = participantsnames;
	}
	public String getMom() {
		return mom;
	}
	public void setMom(String mom) {
		this.mom = mom;
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
	public String getDoctype() {
		return doctype;
	}
	public void setDoctype(String doctype) {
		this.doctype = doctype;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "GovernanceDao [gvid=" + gvid + ", projectid=" + projectid + ", projectname=" + projectname
				+ ", calldate=" + calldate + ", participantsnames=" + participantsnames + ", mom=" + mom
				+ ", createdate=" + createdate + ", modifydate=" + modifydate + ", modifyby=" + modifyby + ", doctype="
				+ doctype + ", subject=" + subject + "]";
	}
	
	
	
}
