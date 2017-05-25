/**
 * 
 */
package com.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jsp.vo.Emp;

/**
 * @author Xiaochao.Zhang
 *
 */
public class EmpDAOImpl implements IEmpDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public EmpDAOImpl(Connection conn) {
		this.conn = conn;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jsp.dao.IEmpDAO#insert(com.jsp.vo.Emp)
	 */
	@Override
	public boolean insert(Emp emp) throws Exception {
		boolean isOK = false;
		String sql = "INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, emp.getEmpno());
		pstmt.setString(2, emp.getEname());
		pstmt.setString(3, emp.getJob());
		pstmt.setDate(4, new java.sql.Date(emp.getHiredate().getTime()));
		pstmt.setFloat(5, emp.getSal());
		isOK = pstmt.executeUpdate() > 0;

		pstmt.close();

		return isOK;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jsp.dao.IEmpDAO#queryByName(java.lang.String)
	 */
	@Override
	public List<Emp> queryByKeyword(String key) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT  empno, ename, job, hiredate, sal FROM emp WHERE ename like ? OR job like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + key + "%");
		pstmt.setString(2, "%" + key + "%");
		ResultSet rs = pstmt.executeQuery();
		Emp emp = null;
		while (rs.next()) {
			emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getFloat(5));
			all.add(emp);
		}

		pstmt.close();

		return all;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jsp.dao.IEmpDAO#queryById(int)
	 */
	@Override
	public Emp queryById(int id) throws Exception {
		Emp emp = null;
		String sql = "SELECT  empno, ename, job, hiredate, sal FROM emp WHERE empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getFloat(5));
		}
		pstmt.close();
		return emp;
	}

}
