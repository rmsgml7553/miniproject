package board_rep;

import java.sql.Date;

public class Board_repVo {
	
	private int num;
	private int b_num;
	private String id;
	private String content;
	private Date date;
	
	public Board_repVo() {}
	

	public Board_repVo(int num, int b_num, String id, String content, Date date) {
		super();
		this.num = num;
		this.b_num = b_num;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	@Override
	public String toString() {
		return "Board_repVo [id=" + id + ", content=" + content + ", date=" + date + ", num=" + num + ", b_num=" + b_num
				+ "]";
	}
	
	
	
	
}
