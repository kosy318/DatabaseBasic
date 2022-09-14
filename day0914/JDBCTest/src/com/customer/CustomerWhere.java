package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CustomerWhere {
	
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/scottdb";
		String user = "scott";
		String password = "tiger";
		String driver = "com.mysql.cj.jdbc.Driver";
		// 1. 주소가 seoul인 레코드만 검색
		String q = "select num, name, address from customer where address='seoul'";
		
		try {
			// 1. driver loading: 사용할 DB 등록
			Class.forName(driver);
			
			// 2. connection 생성: 네트워크 연결
			Connection con = DriverManager.getConnection(url, user, password);
			
			// 3. Statement 생성: query를 담는 그릇과 같은 역할
			Statement stat = con.createStatement();
			
			// 4. Query 실행
			ResultSet rs = stat.executeQuery(q);
			
			// 5. 결과처리
			while(rs.next()) {
				String num = rs.getString(1);
				String name = rs.getString(2);
				String address = rs.getString(3);
				
				System.out.println(num + " : " + name + " - " + address.toUpperCase());
			}
			
			// 6. 마무리
			stat.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}