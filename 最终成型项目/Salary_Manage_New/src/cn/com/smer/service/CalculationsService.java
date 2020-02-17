package cn.com.smer.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.smer.dao.dto.Calculations;
import cn.com.smer.dao.dto.Projects;
import cn.com.smer.dao.inter.CalculationsMapper;
import cn.com.smer.dao.inter.ProjectsMapper;
import cn.com.smer.dtoform.CalculationsForm;

@Service
public class CalculationsService {
	@Autowired
	private CalculationsMapper calculationsDao;
	@Autowired
	private ProjectsMapper projectsDao;

	public boolean insertSelective(CalculationsForm form) {
		Calculations calculations = new Calculations();
		BeanUtils.copyProperties(form, calculations);
		System.out.println(calculations);
		if (calculationsDao.insertSelective(calculations) == 1) {
			Projects projects = new Projects();
			projects.setProjectId(calculations.getProjectId());
			projects.setCalculationId(calculations.getCalculationId());
			if (projectsDao.updateByPrimaryKeySelective(projects) == 1) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public Calculations selectByPrimaryKey(Long id) {
		return calculationsDao.selectByPrimaryKey(id);
	}

	public boolean updateByPrimaryKeySelective(CalculationsForm form) {
		Calculations calculations = new Calculations();
		BeanUtils.copyProperties(form, calculations);
		System.out.println(form);
		int count = calculationsDao.updateByPrimaryKeySelective(calculations);
		if(count == 1) {
			return true;
		}else {
			return false;
		}
	}
}
