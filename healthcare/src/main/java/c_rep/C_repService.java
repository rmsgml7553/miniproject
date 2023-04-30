package c_rep;

import java.util.ArrayList;

import c_rrep.C_rrepService;
import c_rrep.C_rrepVo;

public class C_repService {
	C_repDao dao;

	public C_repService() {
		this.dao = new C_repDao();
	}

	public void insert(C_repVo vo) {
		if (vo.getId() != null) {
			dao.insert(vo);
		}
	}

	public void delete(int num) {
		dao.delete(num);
	}

	public ArrayList<C_repVo> select(String code) {
		ArrayList<C_repVo> temp = dao.select(code);
		ArrayList<C_repVo> list = new ArrayList<>();
		C_rrepService service = new C_rrepService();
		for (C_repVo vo : temp) {
			ArrayList<C_rrepVo> rrepList = service.select(vo.getNum());
			vo.setList(rrepList);
			list.add(vo);
		}
		return list;
	}
}
