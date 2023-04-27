package p_rrep;

import java.sql.Date;

public class P_rrepVo {
	private int num;
	private int pNum;
	private String id;
	private String content;
	private Date date;

	public P_rrepVo(int num, int pNum, String id, String content, Date date) {
		super();
		this.num = num;
		this.pNum = pNum;
		this.id = id;
		this.content = content;
		this.date = date;
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

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "P_rrepVo [num=" + num + ", pNum=" + pNum + ", id=" + id + ", content=" + content + ", date=" + date
				+ "]";
	}
}
