package p_rep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class P_repDao {
	DBConnect dbconn;

	public P_repDao() {
		this.dbconn = DBConnect.getInstance();
	}
	
	public void insert(P_repVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into p_rep values(seq_p_rep.nextVal,?,?,?,sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getCode());
			pstmt.executeUpdate();
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
	
	public void delete(String id) {
		Connection conn = dbconn.conn();
		String sql = "delete p_rep where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
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

	public ArrayList<P_repVo> select(String code) {
		Connection conn = dbconn.conn();
		String sql = "select * from p_rep where code = ?";
		ArrayList<P_repVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new P_repVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(5), rs.getString(4)));
			}
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
		return list;
	}
	
	
	
	
}
