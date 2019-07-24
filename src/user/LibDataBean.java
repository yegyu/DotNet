package user;

import java.sql.Timestamp;

public class LibDataBean {
	private int s_num;
	private String mem_id; //참가 아이디
	private String subject;
	private int point;
	private int hits;
	private int partnum;
	private Timestamp d ;
	private String thumb_path;
	private int s_tp_num;
	
	
	
	public int getS_tp_num() {
		return s_tp_num;
	}
	public void setS_tp_num(int s_tp_num) {
		this.s_tp_num = s_tp_num;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getD() {
		return d;
	}
	public void setD(Timestamp d) {
		this.d = d;
	}
	public String getThumb_path() {
		return thumb_path;
	}
	public void setThumb_path(String thumb_path) {
		this.thumb_path = thumb_path;
	}
	
	
}
