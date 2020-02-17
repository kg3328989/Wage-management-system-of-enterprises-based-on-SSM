package cn.com.smer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.smer.dao.dto.Departments;
import cn.com.smer.dao.dto.Employees;
import cn.com.smer.dao.dto.FixedSalarys;
import cn.com.smer.dao.dto.Projects;
import cn.com.smer.dao.dto.SalarySettlements;
import cn.com.smer.dao.inter.DepartmentsMapper;
import cn.com.smer.dao.inter.EmployeesMapper;
import cn.com.smer.dao.inter.FixedSalarysMapper;
import cn.com.smer.dao.inter.ProjectsMapper;
import cn.com.smer.dtoform.FixedSalarysForm;

@Service
public class FixedSalarysService {

	@Autowired
	private FixedSalarysMapper fixedSalarysDao;
	@Autowired
	private ProjectsMapper projectsDao;
	@Autowired
	private EmployeesMapper employeesDao;
	@Autowired
	private DepartmentsMapper departmentsDao;

	// 按部门新增员工固定工资信息（新部门初始化）
	public void insertByDepartmentId(Long deptId) {
		if (fixedSalarysDao.selectByDeptIdSelective(deptId).size() == 0) {
			List<Employees> empe = employeesDao.selectByDepartmentId(deptId);
			List<Long> ppd = projectsDao.selectProjectIdByOne();
			for (Employees emp : empe) {
				for (Long pp : ppd) {
					FixedSalarys a = new FixedSalarys();
					a.setDepartmentId(deptId);
					a.setEmployeeId(emp.getEmployeeId());
					a.setProjectId(pp);
					Long b = Long.valueOf(0);
					a.setSalary(b);
					int c = fixedSalarysDao.insertSelective(a);
					if (c == 0) {
						//System.out.println("新部门员工固定工资新增信息出错！");
					}
				}
			}
		}
	}

	// 部门新员工固定工资信息初始化（员工初始化）
	public void checkNewEmployee(Long deptId, List<Employees> allEmp) {
		List<Long> ppd = projectsDao.selectProjectIdByOne();
		for (Employees emp : allEmp) {
			if (fixedSalarysDao.selectByEmpIdSelective(emp.getEmployeeId()).size() == 0) {
				for (Long pp : ppd) {
					FixedSalarys a = new FixedSalarys();
					a.setDepartmentId(deptId);
					a.setEmployeeId(emp.getEmployeeId());
					a.setProjectId(pp);
					Long b = Long.valueOf(0);
					a.setSalary(b);
					int c = fixedSalarysDao.insertSelective(a);
					if (c == 0) {
						//System.out.println("新员工固定工资新增信息出错！");
					}
				}
			}
		}
	}

	// 初始化操作
	public void initialize(Long deptId) {
		//System.out.println("開始初始化！" + deptId);
		List<Long> fspd = fixedSalarysDao.selectProjectIdByDepartmentId(deptId);
		//System.out.println("标记点1");
		List<Long> ppd = projectsDao.selectProjectIdByOne();
		//System.out.println("标记点2");
		List<Employees> empe = employeesDao.selectByDepartmentId(deptId);
		/*for(Employees a : empe) {
			System.out.println("员工Id=" + a.getEmployeeId());
			System.out.println("员工姓名=" + a.getEmployeeName());
			System.out.println();
		}*/
		//System.out.println("标记点3");
		for (Long pp : ppd) {

			if (!fspd.contains(pp)) {
				//System.out.println("标记点4");
				// 查找所有员工
				for (Employees emp : empe) {
					FixedSalarys a = new FixedSalarys();
					a.setDepartmentId(emp.getDepartmentId());
					a.setEmployeeId(emp.getEmployeeId());
					a.setProjectId(pp);
					Long b = Long.valueOf(0);
					a.setSalary(b);
					int c = fixedSalarysDao.insertSelective(a);
					if (c == 0) {
						//System.out.println("初始化出错！");
					}
				}
				//System.out.println("标记点5");
			}

		}
	}

	// 通过部门Id查询固定工资详细
	public List<FixedSalarys> selectByDeptId(Long deptid) {
		List<FixedSalarys> fixedSalarys = fixedSalarysDao.selectByDeptIdSelective(deptid);
		return fixedSalarys;
	}

	// 通过员工Id查询固定工资详细
	public List<FixedSalarys> selectByEmpId(Long empId) {
		List<FixedSalarys> fixedSalarys = fixedSalarysDao.selectByEmpIdSelective(empId);
		return fixedSalarys;
	}

	// 通过固定项目编号修改固定项目
	public boolean updateByPrimaryKeySelective(FixedSalarysForm fsForm) {
		// 数据的拷贝,要保证两个对象中的属性名一致。
		FixedSalarys fs = new FixedSalarys();
		BeanUtils.copyProperties(fsForm, fs);
		int count = fixedSalarysDao.updateByPrimaryKeySelective(fs);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 通过员工编号和项目编号修改工资值
	public boolean batchUpdate(FixedSalarysForm fsForm) {
		// 数据的拷贝,要保证两个对象中的属性名一致。
		FixedSalarys fs = new FixedSalarys();
		BeanUtils.copyProperties(fsForm, fs);

		List<Long> employees = fsForm.getCheckbox();

		int temp = 1;
		for (Long employee : employees) {
			fs.setEmployeeId(employee);
			int count = fixedSalarysDao.batchUpdate(fs);
			if (count != 1) {
				temp = 0;
				break;
			}
		}
		if (temp == 1) {
			return true;
		} else {
			return false;
		}
	}

	// Excal表格信息录入
	public boolean updateByExcelAll(List<Map> arrFixedSalaryId) {
		boolean result = true;
		int conth = 0;//行计数
		int contl = 0;//列计数
		List<Long> id = new ArrayList<Long>();//转存id list
		int count = 0;//固定工资项目计数器
		//行循环
		for (Map l : arrFixedSalaryId) {
			//System.out.println("第" + conth + "次行循环！");
			FixedSalarys fx = new FixedSalarys();
			//判断是不是固定工资名称那一行
			if(conth == 0) {
				int length = l.size();
				//System.out.println("**************" + l.size());
				//进行特殊 列循环 处理
				for(contl = 3 ; contl< length ; contl++) {
					String projectName = (String) l.get(contl);
					//System.out.println("projectName" + projectName);
					List<Projects> projectid = projectsDao.selectByProjectName(projectName);
					
					//测试区域*********************************************************
					for(Projects m : projectid) {
						//System.out.println("**************" + m.getProjectName());
						//System.out.println("**************" + m.getProjectId());
					}
					//测试区域*********************************************************
					
					id.add(projectid.get(0).getProjectId());//编号进队
				}
				contl = 0;//列指针初始化
				conth++;//行指针后移
				continue;
			}
			
			if(conth != 0) {
				int length = l.size();
				//System.out.println("l.size()" + l.size());
				//列循环
				for(contl = 0 ; contl< length ; contl++) {
					if(contl == 0) {
						String empId = (String) l.get(contl);
						fx.setEmployeeId(Long.valueOf(empId));//员工编号get！
					}
					if(contl == 2) {
						Departments dept = departmentsDao.selectByName((String) l.get(contl));
						fx.setDepartmentId(dept.getDepartmentId());//部门编号get！
					}
					if(contl >= 3) {
						
						fx.setProjectId(id.get(count));//项目编号get!
						String slry = (String) l.get(contl);
						
						//进行插入之前需要进行salary判断
						FixedSalarys fxtest = fixedSalarysDao.selectBySelective(fx);
						if(fxtest != null) {
							//说明数据存在，进行数据修改
							fxtest.setSalary(Long.valueOf(slry));//对应工资get!
							int i = fixedSalarysDao.updateByPrimaryKeySelective(fxtest);
							if(i == 1) {
								result = true;
							}else {
								//System.out.println("修改数据出错！");
								//System.out.println(fxtest.toString());
								return false;
							}
						}else {
							//说明数据不存在，进行数据新增
							fx.setSalary(Long.valueOf(slry));//对应工资get!
							int i = fixedSalarysDao.insertSelective(fx);
							if(i == 1) {
								result = true;
							}else {
								//System.out.println("插入数据出错！");
								//System.out.println(fx.toString());
								return false;
							}
						}
						count++;
					}
				}
			}
			contl = 0;//列指针归零
			count = 0;//固定工资项目计数器归零
			conth++;//行指针后移
		}
		return result;
	}
}
