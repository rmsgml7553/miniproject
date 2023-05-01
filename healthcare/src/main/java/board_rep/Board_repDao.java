package board_rep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import conn.DBConnect;

public class Board_repDao {
	
		DBConnect dbconn;

		public Board_repDao() {
			this.dbconn = DBConnect.getInstance();
		}
		
		
		public void insert(Board_repVo vo) {
			Connection conn = dbconn.conn();
			String sql = "insert into board_reps values(seq_b_rep.nextVal,?,?,?,sysdate)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getB_num());
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
			String sql = "delete board_reps where num = ?";
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
		
		public void update(Board_repVo vo) {
			Connection conn = dbconn.conn();
			String sql = "update  board_reps set content = ? where num=?";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getContent());
				pstmt.setInt(2, vo.getNum());
				
				
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
		
		public ArrayList<Board_repVo> select(int num) {
			Connection conn = dbconn.conn();
			String sql = "select * from board_reps where b_num = ? order by num desc";
			ArrayList<Board_repVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new Board_repVo(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getString(4),rs.getDate(5)));
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
