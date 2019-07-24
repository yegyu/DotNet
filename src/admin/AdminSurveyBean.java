package admin;

import java.sql.Timestamp;

public class AdminSurveyBean {
	private int s_num;
	private int b_tp_num;
	private int ct_num;
	private int s_tp_num;
	private String subject;	
	private String writer;	
	private String thumb_path;	
	private int point;
	private int hits;
	private int partnum;
	private Timestamp s_date;
	private String memberid;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getB_tp_num() {
		return b_tp_num;
	}
	public void setB_tp_num(int b_tp_num) {
		this.b_tp_num = b_tp_num;
	}
	public int getCt_num() {
		return ct_num;
	}
	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}
	public int getS_tp_num() {
		return s_tp_num;
	}
	public void setS_tp_num(int s_tp_num) {
		this.s_tp_num = s_tp_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getThumb_path() {
		return thumb_path;
	}
	public void setThumb_path(String thumb_path) {
		this.thumb_path = thumb_path;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getPartnum() {
		return partnum;
	}
	public void setPartnum(int partnum) {
		this.partnum = partnum;
	}
	public Timestamp getS_date() {
		return s_date;
	}
	public void setS_date(Timestamp s_date) {
		this.s_date = s_date;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	
	
}
