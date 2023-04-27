package clinicbookmark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class C_BookmarkDao {
	DBConnect dbconn;

	public C_BookmarkDao() {
		this.dbconn = DBConnect.getInstance();
	}


	public void insert(C_BookmarkVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into clinic values(?,?)";
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getCode());
		
			
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
	
	public boolean find(String id, String code) {
		
		boolean flag = false;
		Connection conn = dbconn.conn();
		String sql = "select * from clinic where id = ? and code = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,code);

			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			};
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public ArrayList<String> select(String id){
		Connection conn = dbconn.conn();
		
		ArrayList<String> list = new ArrayList<>();	
		String sql = "select * from clinic where id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list.add((rs.getString(2)));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public void delete(String id, String code) {
		System.out.println("delete 실행");
		Connection conn = dbconn.conn();
		String sql = "delete from clinic where id = ? and code = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,code);

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
}
