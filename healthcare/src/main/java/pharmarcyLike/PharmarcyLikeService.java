package pharmarcyLike;

import java.util.ArrayList;

public class PharmarcyLikeService {
	PharmarcyLikeDao dao;

	public PharmarcyLikeService() {
		dao = new PharmarcyLikeDao();
	}
	
	public void input(String id, String code) {
		dao.input(id, code);
	}
	public void delete(String id, String code) {
		dao.delete(id, code);
	}
	public ArrayList<String> input(String id) {
		return dao.listById(id);
	}
	public String find(String id, String code) {
		return dao.find(id, code);
	}
}
