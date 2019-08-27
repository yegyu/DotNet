package main;

import java.sql.Timestamp;

/**
 * @author JeongYeGyu
 *
 */
public class BoardAskDataBean {
	private int num;
	private String title;
	private String contents;
	private String id;
	private String passwd;
	private Timestamp aDate;
	private int aState;
	private int views;
	private int secret;
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getaDate() {
		return aDate;
	}
	public void setaDate(Timestamp aDate) {
		this.aDate = aDate;
	}
	public int getaState() {
		return aState;
	}
	public void setaState(int aState) {
		this.aState = aState;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
	
}









