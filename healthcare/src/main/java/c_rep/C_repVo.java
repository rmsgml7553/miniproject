package c_rep;

import java.sql.Date;
import java.util.ArrayList;

import c_rrep.C_rrepVo;

public class C_repVo {
	private int num;
	private String id;
	private String content;
	private String code;
	private Date date;
	private ArrayList<C_rrepVo> list;

	public C_repVo() {
	}

	public C_repVo(int num, String id, String content, String code, Date date, ArrayList<C_rrepVo> list) {
		this.num = num;
		this.id = id;
		this.content = content;
		this.code = code;
		this.date = date;
		this.list = list;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public ArrayList<C_rrepVo> getList() {
		return list;
	}

	public void setList(ArrayList<C_rrepVo> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "C_repVo [num=" + num + ", id=" + id + ", content=" + content + ", code=" + code + ", date=" + date
				+ ", list=" + list + "]";
	}
}
