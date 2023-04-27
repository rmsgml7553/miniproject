package p_rep;

import java.sql.Date;

public class P_repVo {
	private int num;
	private String id;
	private String content;
	private Date date;
	private String code;

	public P_repVo(int num, String id, String content, Date date, String code) {
		this.id = id;
		this.content = content;
		this.date = date;
		this.code = code;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "C_repVo [id=" + id + ", content=" + content + ", date=" + date + ", code=" + code + ", num=" + num
				+ "]";
	}

}
