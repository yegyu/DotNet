package user;

import java.sql.Timestamp;

public class MessageDataBean {
	private int m_num;  //nextval
	private String m_title; 
	private String m_content;
	private String s_mem_id; //
	private int s_mem_del_st; //0  1 삭제
	private String r_mem_id;  //
	private int r_mem_del_st; //0	1
	private Timestamp m_date;
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getS_mem_id() {
		return s_mem_id;
	}
	public void setS_mem_id(String s_mem_id) {
		this.s_mem_id = s_mem_id;
	}
	public int getS_mem_del_st() {
		return s_mem_del_st;
	}
	public void setS_mem_del_st(int s_mem_del_st) {
		this.s_mem_del_st = s_mem_del_st;
	}
	public String getR_mem_id() {
		return r_mem_id;
	}
	public void setR_mem_id(String r_mem_id) {
		this.r_mem_id = r_mem_id;
	}
	public int getR_mem_del_st() {
		return r_mem_del_st;
	}
	public void setR_mem_del_st(int r_mem_del_st) {
		this.r_mem_del_st = r_mem_del_st;
	}
	public Timestamp getM_date() {
		return m_date;
	}
	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	} 
	
	

	
	
}
