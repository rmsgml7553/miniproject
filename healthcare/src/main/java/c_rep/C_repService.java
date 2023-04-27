package c_rep;

import java.util.ArrayList;

public class C_repService {
	C_repDao dao;

	public C_repService() {
		this.dao = new C_repDao();
	}

	public void insert(C_repVo vo) {
		if(vo.getId() != null) {
			dao.insert(vo);
		}
	}
	public void delete(String id) {
		dao.delete(id);
	}
	public ArrayList<C_repVo> select(String code) {
		return dao.select(code);
	}
}
