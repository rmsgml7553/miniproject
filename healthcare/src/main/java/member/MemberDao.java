package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class MemberDao {
	private DBConnect dbconn;
	
	public MemberDao() {
		dbconn = DBConnect.getInstance();
	}
	
	// 일반가입
	public void geInsert(MemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert  into member values (?, ?, ?, ?, ?, ?, null, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			pstmt.setInt(6, vo.getmCode());
			pstmt.setString(7, vo.getGender());
			pstmt.setDate(8, vo.getBirth());
			pstmt.executeUpdate();
			System.out.println("일반 회원가입!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// 관계자 가입
	public void reInsert(MemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into  member values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			pstmt.setInt(6, vo.getmCode());
			pstmt.setString(7, vo.getCode());
			pstmt.setString(8, vo.getGender());
			pstmt.setDate(9, vo.getBirth());
			pstmt.executeUpdate();
			System.out.println("관계자 회원가입!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 탈퇴
	public void deleteMember(String id) {
		Connection conn = dbconn.conn();
		String sql = "delete member where id=?";
		System.out.println("탈퇴 dao");
		System.out.println(id);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println("탈퇴 dao");
			System.out.println(id);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println(id+" 탈퇴!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	// 내회원정보수정
	public void updateMember(MemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update member set name=?, pwd=?, phone=?, address=? where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getId());
			pstmt.executeUpdate();
			System.out.println("수정완료!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	// 내회원정보확인
	public MemberVo selectMember(String id) {
		Connection conn = dbconn.conn();
		MemberVo vo = null;
		String sql = "select * from member where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVo(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getDate(9));
			}
			System.out.println(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
	
}
