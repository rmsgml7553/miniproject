package pharmarcyLike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class PharmarcyLikeDao {
	DBConnect dbconn;

	public PharmarcyLikeDao() {
		this.dbconn = DBConnect.getInstance();
	}

	public void input(String id, String code, String name) {
		System.out.println("id : " + id + "code : " + code);
		Connection conn = dbconn.conn();
		String sql = "insert into pharmacy values(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, code);
			pstmt.setString(3, name);
			pstmt.execute();
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

	public ArrayList<PharmarcyLikeVo> listById(String id) {
		ArrayList<PharmarcyLikeVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from pharmacy where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new PharmarcyLikeVo(rs.getString(1), rs.getString(2), rs.getString(3)));
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

	public String find(String id, String code) {
		String result = null;
		Connection conn = dbconn.conn();
		String sql = "select code from pharmacy where id = ? and code = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, code);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
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
		return result;
	}

	public void delete(String id, String code) {
		Connection conn = dbconn.conn();
		String sql = "delete pharmacy where id = ? and code = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, code);
			pstmt.execute();
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

}
