package pharmarcyLike;

import java.util.ArrayList;

public class PharmarcyLikeService {
	PharmarcyLikeDao dao;

	public PharmarcyLikeService() {
		dao = new PharmarcyLikeDao();
	}
	
	public void input(String id, String code, String name) {
		dao.input(id, code,name);
	}
	public void delete(String id, String code) {
		dao.delete(id, code);
	}
	public ArrayList<PharmarcyLikeVo> listById(String id) {
		return dao.listById(id);
	}
	public String find(String id, String code) {
		return dao.find(id, code);
	}
}
