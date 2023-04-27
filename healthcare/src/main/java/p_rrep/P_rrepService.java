package p_rrep;

import java.util.ArrayList;

public class P_rrepService {
	P_rrepDao dao;

	public P_rrepService() {
		this.dao = new P_rrepDao();
	}

	public void insert(P_rrepVo vo) {
		dao.insert(vo);
	}
	public void delete(String id) {
		dao.delete(id);
	}
	public ArrayList<P_rrepVo> select(int pNum) {
		return dao.select(pNum);
	}
}
