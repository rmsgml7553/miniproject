package board;

import java.sql.Date;
import java.util.ArrayList;

import board_rep.Board_repVo;

public class BoardVo {
	
	private int num;
	private String id;
	private String title;
	private String content;
	private int cnt;
	private String path;
	private Date w_date;
	private ArrayList<Board_repVo> list;
	
	
	public BoardVo() {} ;
	public BoardVo(int num, String id, String title, String content, int cnt, String path, Date w_date) {
		this.num = num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.cnt = cnt;
		this.path = path;
		this.w_date = w_date;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	
	@Override
	public String toString() {
		return "BoardVo [num=" + num + ", id=" + id + ", title=" + title + ", content=" + content + ", cnt=" + cnt
				+ ", path=" + path + ", w_date=" + w_date + "]";
	}
	
}
