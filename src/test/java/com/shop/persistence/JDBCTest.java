package com.shop.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest { //mysql 연동 테스트

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() {
		try(Connection con =
							DriverManager.getConnection(
											"jdbc:mysql://localhost:3306/mcos?serverTimezone=Asia/Seoul",
											"root",
											"0304")){
			System.out.println(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
