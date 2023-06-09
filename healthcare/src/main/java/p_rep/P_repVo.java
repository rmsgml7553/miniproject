package p_rep;

import java.sql.Date;
import java.util.ArrayList;

import p_rrep.P_rrepVo;

public class P_repVo {
	private int num;
	private String id;
	private String content;
	private Date date;
	private String code;
	private ArrayList<P_rrepVo> list;

	

	public P_repVo(int num, String id, String content, Date date, String code, ArrayList<P_rrepVo> list) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.date = date;
		this.code = code;
		this.list = list;
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

	
	public ArrayList<P_rrepVo> getList() {
		return list;
	}

	public void setList(ArrayList<P_rrepVo> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "P_repVo [num=" + num + ", id=" + id + ", content=" + content + ", date=" + date + ", code=" + code
				+ ", list=" + list + "]";
	}
}
