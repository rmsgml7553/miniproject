package like_board;

import board.BoardDao;

public class Like_BoardService {
	private Like_BoardDao dao;
	
	public Like_BoardService() {
		dao = new Like_BoardDao();
	}
	
	// 아이디로 검색
	public Like_BoardVo selectId(String id) {
		return dao.selectId(id);
	}
	
	// 아이디를 넣는다.
	public void insertId(String id) {
		dao.insertId(id);
	}
	
	
	// 
	public void click(int num) {
		dao.click(num);
	}
	
	
	// 좋아요 총수를 표시하는 service
	public int selectByNum(int num) {
		return dao.selectByNum(num);
	}

	//
	public void insert(Like_BoardVo vo) {
		dao.insert(vo);
	}
	
	public boolean selectByLike(Like_BoardVo vo) {
		return dao.selectByLike(vo);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
}

