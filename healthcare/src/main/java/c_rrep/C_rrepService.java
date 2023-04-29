package c_rrep;

import java.util.ArrayList;

public class C_rrepService {
	C_rrepDao dao;

	public C_rrepService() {
		this.dao = new C_rrepDao();
	}

	public void insert(C_rrepVo vo) {
		dao.insert(vo);
	}
	public void delete(int num) {
		dao.delete(num);
	}
	public ArrayList<C_rrepVo> select(int cNum) {
		return dao.select(cNum);
	}
}
