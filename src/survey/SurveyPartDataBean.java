package survey;

import java.sql.Timestamp;

public class SurveyPartDataBean {
	private int part_num;
	private String mem_id;
	private int s_num;
	private int q_num;
	private int cho_num;
	private Timestamp part_date;
	
	
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
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
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public int getCho_num() {
		return cho_num;
	}
	public void setCho_num(int cho_num) {
		this.cho_num = cho_num;
	}
	public Timestamp getPart_date() {
		return part_date;
	}
	public void setPart_date(Timestamp part_date) {
		this.part_date = part_date;
	}
	
	
}
