package user;

import java.sql.Timestamp;

public class CompanyDataBean {
	
private int a_num;
private String co_email;
private String a_name;
private String co_content;
private String co_type;
private String co_code;
private Timestamp w_date;

public int getA_num() {
	return a_num;
}
public void setA_num(int a_num) {
	this.a_num = a_num;
}
public String getCo_email() {
	return co_email;
}
public void setCo_email(String co_email) {
	this.co_email = co_email;
}
public String getA_name() {
	return a_name;
}
public void setA_name(String a_name) {
	this.a_name = a_name;
}
public String getCo_content() {
	return co_content;
}
public void setCo_content(String co_content) {
	this.co_content = co_content;
}
public String getCo_type() {
	return co_type;
}
public void setCo_type(String co_type) {
	this.co_type = co_type;
}
public String getCo_code() {
	return co_code;
}
public void setCo_code(String co_code) {
	this.co_code = co_code;
}
public Timestamp getW_date() {
	return w_date;
}
public void setW_date(Timestamp w_date) {
	this.w_date = w_date;
}

}
