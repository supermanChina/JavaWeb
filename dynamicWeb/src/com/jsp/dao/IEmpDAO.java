package com.jsp.dao;

import java.util.List;

import com.jsp.vo.Emp;

public interface IEmpDAO {

	public boolean insert(Emp emp) throws Exception;

	public List<Emp> queryByKeyword(String key) throws Exception;

	public Emp queryById(int id) throws Exception;
}
