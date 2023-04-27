package clinicbookmark;

import java.util.ArrayList;

public class C_BookmarkService {
	C_BookmarkDao dao;

	public C_BookmarkService() {
		this.dao = new C_BookmarkDao();
	}

	public void insert(C_BookmarkVo vo) {
		dao.insert(vo);
	}
	
	public boolean find(String id, String code) {
		return dao.find(id, code);
	}
	
	public ArrayList<String> select(String id){
		return dao.select(id);
	}
	public void delete(String id, String code) {
		dao.delete(id, code);
	}
}
