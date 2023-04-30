package board_rep;

import java.util.ArrayList;

public class Board_repService {
private Board_repDao dao;
	
	public Board_repService() {
		dao = new Board_repDao();
	}
	
	public void insert(Board_repVo vo) {
		dao.insert(vo);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
	public void update(Board_repVo vo) {
		dao.update(vo);
	}
	
	public ArrayList<Board_repVo> select(int num){
		return dao.select(num);
	}
}
