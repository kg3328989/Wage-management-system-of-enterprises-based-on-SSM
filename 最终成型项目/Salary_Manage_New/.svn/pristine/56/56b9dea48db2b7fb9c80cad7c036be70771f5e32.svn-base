package cn.com.smer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.smer.dtoform.SalarySettlementDetailsForm;
import cn.com.smer.service.SalarySettlementDetailsService;
/*
 * 	工资结算详情表
 * 		存储显示更加详细的员工工资信息和员工信息
 * 
 * 
 */
@Controller
@RequestMapping(value = "/salarySettlementDetails")
public class SalarySettlementDetailsController {
	@Autowired
	private SalarySettlementDetailsService salarySettlementDetailsService;

	@RequestMapping(value = "/{id}")
	public String details(Model model, @PathVariable("id") Long salarySettlementId) {
		List<SalarySettlementDetailsForm> listSalarySettlementDetails = salarySettlementDetailsService.selectBysalarySettlementId(salarySettlementId);
		Long salarySum = salarySettlementDetailsService.selectTureSalary(salarySettlementId);
		Long salaryState = salarySettlementDetailsService.selectSalaryState(salarySettlementId);
		model.addAttribute("salaryState",salaryState);
		model.addAttribute("salarySum", salarySum);
		model.addAttribute("salarySettlementId", salarySettlementId);
		model.addAttribute("listSalarySettlementDetails", listSalarySettlementDetails);
		return "/salarySettlements/salary_settlement_details";
	}
}
