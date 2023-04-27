package member;

public class MemberService {
	public MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	
	public void joinRMember(MemberVo vo) {
		dao.reInsert(vo);
	}
	public void joinMember(MemberVo vo) {
		dao.geInsert(vo);
	}
	
	public void delMember(String id) {
		dao.deleteMember(id);
	}
	
	public void editMember(MemberVo vo) {
		dao.updateMember(vo);
	}
	
	public MemberVo getByMember(String id) {
		return dao.selectMember(id);
	}

}
