package c_rrep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class C_rrepDao {
	DBConnect dbconn;

	public C_rrepDao() {
		this.dbconn = DBConnect.getInstance();
	}
	
	public void insert(C_rrepVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into c_rrep values(seq_c_rrep.nextVal,?,?,?,sysdate)";
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
	
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete c_rrep where num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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

	public ArrayList<C_rrepVo> select(int cNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from c_rrep where c_num = ?";
		ArrayList<C_rrepVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new C_rrepVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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
