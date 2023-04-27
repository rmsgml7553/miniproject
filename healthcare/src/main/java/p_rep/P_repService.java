package p_rep;

import java.util.ArrayList;

public class P_repService {
	P_repDao dao;

	public P_repService() {
		this.dao = new P_repDao();
	}

	public void insert(P_repVo vo) {
		if(vo.getId() != null) {
			dao.insert(vo);
		}
	}
	public void delete(String id) {
		dao.delete(id);
	}
	public ArrayList<P_repVo> select(String code) {
		return dao.select(code);
	}
}
