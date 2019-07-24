package user;

import java.sql.Timestamp;

public class GoodsStDataBean{

	private int t_num;
	private String g_name;
	private String mem_id;
	private int g_point;
	private int g_cnt;
	private Timestamp t_date;
	private int tst_num;
	
	
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_point() {
		return g_point;
	}
	public void setG_point(int g_point) {
		this.g_point = g_point;
	}
	public int getG_cnt() {
		return g_cnt; 
	}
	public void setG_cnt(int g_cnt) {
		this.g_cnt = g_cnt;
	}
	public Timestamp getT_date() {
		return t_date;
	}
	public void setT_date(Timestamp t_date) {
		this.t_date = t_date;
	}
	public int getTst_num() {
		return tst_num;
	}
	public void setTst_num(int tst_num) {
		this.tst_num = tst_num;
	}
	
	
}
