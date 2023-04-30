package like_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class Like_BoardDao {
  private DBConnect dbconn;
  
  public Like_BoardDao() {
	  dbconn = DBConnect.getInstance();
  }
	
  
	
	// 좋아요 총 수를 표시하는 sql
	// select count(*) from like_board where num = 1;
	public int selectByNum(int num) {
		Connection conn = dbconn.conn();
		String sql = "select count(*) from like_board where num = ?";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 행에 값이 있으면 true. 행 단위로 표시함.
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	public boolean selectByLike(Like_BoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "select * from like_board where num = ? and id = ?";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return false; // 검색값이 이미 존재하면 false
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
		return true; // 검색값이 존재하지 않는다면 true
	}
	
	
	// 아이디로 검색
	public Like_BoardVo selectId(String id) {
		Connection conn = dbconn.conn();
		String sql = "select * from like_board where id=?";
		Like_BoardVo vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new Like_BoardVo(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	// id를 넣는것.
	public void insertId(String id) {
		Connection conn = dbconn.conn();
		String sql = "insert into like_board where id=? ";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//insert
	public void insert(Like_BoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into like_board values(?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
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
	
	// delete
	public void deleteLike(Like_BoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "delete from like_board where num=? and id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
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
