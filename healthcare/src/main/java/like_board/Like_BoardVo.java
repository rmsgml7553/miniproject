package like_board;

public class Like_BoardVo {
	
	private int num;
	private String id;
	
	public Like_BoardVo() {};
	public Like_BoardVo(int num, String id) {
		this.num = num;
		this.id = id;
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
	
	@Override
	public String toString() {
		return "Like_BoardVo [num=" + num + ", id=" + id + "]";
	}
	
}
