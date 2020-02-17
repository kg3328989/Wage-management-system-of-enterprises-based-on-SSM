package cn.com.smer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.smer.dao.dto.Employees;
import cn.com.smer.dao.inter.EmployeesMapper;

@Service
public class EmployeesService {
	@Autowired
	private EmployeesMapper employeesDao;
	
	public List<Employees> selectByDepartmentId(Long deptid){
		List<Employees> empAll = employeesDao.selectByDepartmentId(deptid);
		
		return empAll;
	}
	public List<Employees> getAll(){
		return employeesDao.selectAll();
	}
	//��ѯ�Ƿ������Ա��
	public boolean selectEmployee(Long employeeId) {
		List<Employees> emp = employeesDao.selectEmployees(employeeId);
		if(emp.size()==0) {
			return true;
		}else {
			return false;
		}
	}
	//sxb
	public String selectNameByEmployeeId(Long EmployeeId) {
		Employees a = new Employees();
		a = employeesDao.selectEmployeeById(EmployeeId);
		if(a != null)
		return a.getEmployeeName();
		else return null;
	}
}
