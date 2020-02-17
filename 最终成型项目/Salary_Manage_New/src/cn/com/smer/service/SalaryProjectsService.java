package cn.com.smer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.smer.dao.dto.SalaryProjects;
import cn.com.smer.dao.inter.SalaryProjectsMapper;

@Service
public class SalaryProjectsService {
	@Autowired
	private SalaryProjectsMapper salaryProjectsDao;

	public List<SalaryProjects> selectAll() {
		
		return salaryProjectsDao.selectAll();
	}
}
