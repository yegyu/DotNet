package user;

import java.sql.Timestamp;

public class FrDataBean {
	private int f_num;
	private int f_st;
	private String req_mem_id;
	private Timestamp req_date;
	private String 	res_mem_id;
	private Timestamp res_data;
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public int getF_st() {
		return f_st;
	}
	public void setF_st(int f_st) {
		this.f_st = f_st;
	}
	public String getReq_mem_id() {
		return req_mem_id;
	}
	public void setReq_mem_id(String req_mem_id) {
		this.req_mem_id = req_mem_id;
	}
	public Timestamp getReq_date() {
		return req_date;
	}
	public void setReq_date(Timestamp req_date) {
		this.req_date = req_date;
	}
	public String getRes_mem_id() {
		return res_mem_id;
	}
	public void setRes_mem_id(String res_mem_id) {
		this.res_mem_id = res_mem_id;
	}
	public Timestamp getRes_data() {
		return res_data;
	}
	public void setRes_data(Timestamp res_data) {
		this.res_data = res_data;
	}
	
	
	
	

}
