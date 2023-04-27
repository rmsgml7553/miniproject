package board;

import java.util.ArrayList;

public class BoardService {
	private BoardDao dao;
	
	public BoardService() {
		dao = new BoardDao();
	}
	
	public final static String path = "C:\\Users\\KOST\\Desktop\\semiproject 4월\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\board\\";
	// 위의 코드는 public static으로 넣어서 다른 여러 클래스에서 가져다가 사용할수 있다. final을 추가로 붙이면 못고친다.
	
	
	// 원글 목록 검색
	public ArrayList<BoardVo> getAll() {
		return dao.selectAll();
		}
	
	//insert
	public void addBoard(BoardVo vo) {
		dao.insert(vo);
	}
	
	
	//delete
	public void delBoard(int num) {
		dao.delete(num);
	}
	
	
	// 제목 조회수를 1개씩 늘린다.
	public void updateCnt(int num) {
		dao.updateCnt(num);
	}
	
	
	//id로 검색결과 출력
	public BoardVo select(BoardVo vo) {
		return dao.select(vo);
	}
	
	// 숫자로 검색
	public BoardVo selectNum(int num) {
		return dao.selectNum(num);
	}
	
	// 조회수 증가
	public void cnt(int num) {
		dao.cnt(num);
	}
	
	
}
