package user;

import java.sql.Timestamp;

public class CompanyDataBean {
	
private int a_num;
private String co_email;
private String co_name;
private String a_name;
private String co_title;
private String co_content;
private String co_type;
private int co_code;
private int co_read;
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

public String getCo_name() {
	return co_name;
} 
public void setCo_name(String co_name) {
	this.co_name = co_name;
}
public String getA_name() {
	return a_name;
}
public void setA_name(String a_name) {
	this.a_name = a_name;
}
public String getCo_title() {
	return co_title;
}
public void setCo_title(String co_title) {
	this.co_title = co_title;
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
public int getCo_code() {
	return co_code;
}
public void setCo_code(int co_code) {
	this.co_code = co_code;
}

public int getCo_read() {
	return co_read;
}
public void setCo_read(int co_read) {
	this.co_read = co_read;
}
public Timestamp getW_date() {
	return w_date;
}
public void setW_date(Timestamp w_date) {
	this.w_date = w_date;
}

}
