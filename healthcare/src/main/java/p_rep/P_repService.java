package p_rep;

import java.util.ArrayList;

import p_rrep.P_rrepDao;
import p_rrep.P_rrepService;
import p_rrep.P_rrepVo;

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
	public void delete(int num) {
		dao.delete(num);
	}
	public ArrayList<P_repVo> select(String code) {
		ArrayList<P_repVo> temp = dao.select(code);
		ArrayList<P_repVo> list = new ArrayList<>();
		P_rrepService service = new P_rrepService();
		for(P_repVo vo : temp) {
			ArrayList<P_rrepVo> rrepList = service.select(vo.getNum());
			vo.setList(rrepList);
			list.add(vo);
		}
		return list;
	}
}
