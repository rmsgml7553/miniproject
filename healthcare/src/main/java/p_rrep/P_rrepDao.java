package p_rrep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class P_rrepDao {
	DBConnect dbconn;

	public P_rrepDao() {
		this.dbconn = DBConnect.getInstance();
	}
	
	public void insert(P_rrepVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into p_rrep values(seq_p_rrep.nextVal,?,?,?,sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getpNum());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getContent());
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
		String sql = "delete p_rrep where id = ?";
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

	public ArrayList<P_rrepVo> select(int pNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from p_rrep where p_num = ?";
		ArrayList<P_rrepVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new P_rrepVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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
