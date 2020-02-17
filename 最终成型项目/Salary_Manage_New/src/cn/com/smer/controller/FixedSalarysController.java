package cn.com.smer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.com.smer.dao.dto.Departments;
import cn.com.smer.dao.dto.Employees;
import cn.com.smer.dao.dto.FixedSalarys;
import cn.com.smer.dao.dto.Projects;
import cn.com.smer.dao.inter.DepartmentsMapper;
import cn.com.smer.dtoform.FixedSalarysForm;
import cn.com.smer.service.DepartmentsService;
import cn.com.smer.service.EmployeesService;
import cn.com.smer.service.FixedSalarysService;
import cn.com.smer.service.ProjectsService;
/*
 * 	固定工资管理
 * 		1.拥有按部门名称查询员工固定工资具体详情功能
 * 		2.拥有对某部门员工具体某一项固定工资项目进行批量修改的功能
 * 		3.拥有对某部门某一个员工的固定工资进行单独修改的功能
 * 		4.拥有对某部门某一员工的固定工资详情查看功能
 */
@Controller
@RequestMapping(value = "/fixed")
public class FixedSalarysController {
	
	@Autowired//自动注入
	private FixedSalarysService fixedSalaryService;
	@Autowired//自动注入
	private EmployeesService employeesService;
	@Autowired//自动注入
	private DepartmentsService departmentsService;
	@Autowired//自动注入
	private ProjectsService projectsService;
	@Autowired
	private DepartmentsMapper departmentsMapper;
	// 跳转查询页面
	@RequestMapping(value = "/list", params = { "form" })
	public String listForm(Model model) {
		List<Departments> listDepartments = departmentsMapper.selectAll();
		model.addAttribute("listDepartments", listDepartments);
		return "/fixedSalaryManagement/fixed_salary_management_select";
	}
	
	// 显示查询结果
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(String selective,Model model) {
		/*判断是部门名称还是部门编号*/
		boolean temp = true;
		Long deptid = null;
		for(int i = 0;i < selective.length();i++) {
			char o = selective.charAt(i);
			if(o < 48 || o > 57) {
				temp = false;
				break;
			}
		}
		if(temp == true) {
			//System.out.println("进行部门编号查询");
			//字符串转换数字
			deptid = Long.valueOf(selective);
		}
		if(temp == false) {
			//System.out.println("进行部门名称查询");
			Departments dept = departmentsService.selectByName(selective);
			deptid = dept.getDepartmentId();
		}
		//如果该部门信息未导入，则进行此初始化操作
		fixedSalaryService.insertByDepartmentId(deptid);
		//初始化
		fixedSalaryService.initialize(deptid);
		
		/*System.out.println("部门编号注入！" + deptid);*/
		model.addAttribute("deptid",deptid);
		
		List<Employees> empAll = employeesService.selectByDepartmentId(deptid);
		model.addAttribute("empList", empAll);
		//检查该部门是否存在新入职员工，进行初始化
		fixedSalaryService.checkNewEmployee(deptid,empAll);
		
		List<FixedSalarys> fs = fixedSalaryService.selectByDeptId(deptid);
		model.addAttribute("fsList", fs);
		
		List<Departments> deptAll = departmentsService.getAllDepartments();
		model.addAttribute("deptList", deptAll);
		
		/*for(Departments pjA : deptAll) {
			System.out.println("DepartmentId=" + pjA.getDepartmentId());
			System.out.println("DepartmentName=" + pjA.getDepartmentName());
			System.out.println();
		}*/
		List<Projects> pojsAll = projectsService.getAllOneProjects();
		model.addAttribute("pojsList", pojsAll);
		
		/*for(Projects pjA : pojsAll) {
			System.out.println("fixedSalaryId=" + pjA.getProjectName());
			System.out.println("projectId=" + pjA.getProjectId());
			System.out.println();
		}*/
		
		return "/fixedSalaryManagement/fixed_salary_management_form";
	}
	//显示更新员工固定工资表
	@RequestMapping(value="/{empId}/{deptId}/update", params= {"form"})
	public String updateForm(@PathVariable("empId") Long employeeId , @PathVariable("deptId") Long departmentId, Model model) {
		
		model.addAttribute("empId", employeeId);
		model.addAttribute("deptId", departmentId);
		
		List<FixedSalarys> fsListForEmp = fixedSalaryService.selectByEmpId(employeeId);
		/*for(FixedSalarys fs : fsListForEmp) {
			System.out.println("fixedSalaryId=" + fs.getFixedSalaryId());
			System.out.println("projectId=" + fs.getProjectId());
			System.out.println("employeeId=" + fs.getEmployeeId());
			System.out.println("departmentId=" + fs.getDepartmentId());
			System.out.println("salary=" + fs.getSalary());
			System.out.println();
		}*/
		model.addAttribute("fsList", fsListForEmp);
		
		
		List<Employees> empAll = employeesService.selectByDepartmentId(departmentId);
		model.addAttribute("empList", empAll);
		
		List<Departments> deptAll = departmentsService.getAllDepartments();
		model.addAttribute("deptList", deptAll);
		
		List<Projects> pojsAll = projectsService.getAllOneProjects();
		model.addAttribute("pojsList", pojsAll);
		/*for(Projects pojsA : pojsAll) {
			System.out.println("ProjectName=" + pojsA.getProjectName());
			System.out.println("ProjectId=" + pojsA.getProjectId());
			System.out.println();
		}*/
		return "/fixedSalaryManagement/fixed_salary_management_update";
	}
	//更新操作(失败)
	@RequestMapping(value="/{id}/update",params= {"update"},method=RequestMethod.POST)
	public String update(@PathVariable("id") Long employeeId ,FixedSalarysForm form, Model model) {
		//System.out.println(form.getFixedSalaryId());
		boolean result = fixedSalaryService.updateByPrimaryKeySelective(form);
		
		if(result) {
			return "redirect:/fixed/" + employeeId + "/update?complete";
		}else {
			model.addAttribute("updateFsResult", "0");
			return "/fixedSalaryManagement/fixed_salary_management_select";
		}
	}
	//更新成功
	@RequestMapping(value="/{id}/update",params= {"complete"},method=RequestMethod.GET)
	public String updateComplete(Model model) {
		model.addAttribute("updateFsResult", "1");
		return "/fixedSalaryManagement/fixed_salary_management_select";
	}
	//详情界面
	@RequestMapping(value="/{empId}/{deptId}",method=RequestMethod.GET)
	public String detail(@PathVariable("empId") Long employeeId , @PathVariable("deptId") Long departmentId, Model model) {
		model.addAttribute("empId", employeeId);
		model.addAttribute("deptId", departmentId);
		
		List<FixedSalarys> fsListForEmp = fixedSalaryService.selectByEmpId(employeeId);
		model.addAttribute("fsList", fsListForEmp);
		
		List<Employees> empAll = employeesService.selectByDepartmentId(departmentId);
		model.addAttribute("empList", empAll);
		
		List<Departments> deptAll = departmentsService.getAllDepartments();
		model.addAttribute("deptList", deptAll);
		
		List<Projects> pojsAll = projectsService.getAllOneProjects();
		model.addAttribute("pojsList", pojsAll);
		
		return "/fixedSalaryManagement/fixed_salary_management_detail";
	}
	//批量更新操作
	@RequestMapping(value="/batchUpdate",params= {"batchUpdate"},method=RequestMethod.POST)
	public String batchUpdate(FixedSalarysForm form, Long DataTables_Table_0_length, Model model) {
		//System.out.println(form);
		boolean result = fixedSalaryService.batchUpdate(form);
		if(result) {
			return "redirect:/fixed/" + DataTables_Table_0_length + "/batchUpdate?complete";
		}else {
			model.addAttribute("batchUpdateResult", "0");
			return "/fixedSalaryManagement/fixed_salary_management_select";
		}
	}
	//更新成功
	@RequestMapping(value="/{id}/batchUpdate",params= {"complete"},method=RequestMethod.GET)
	public String batchUpdateComplete(Model model) {
		List<Departments> listDepartments = departmentsMapper.selectAll();
		model.addAttribute("listDepartments", listDepartments);
		model.addAttribute("batchUpdateResult", "1");
		return "/fixedSalaryManagement/fixed_salary_management_select";
	}
	
}
