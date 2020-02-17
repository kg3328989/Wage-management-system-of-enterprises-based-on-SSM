package cn.com.smer.dao.inter;

import java.util.List;

import cn.com.smer.dao.dto.SalarySettlementDetails;
import cn.com.smer.dao.dto.SalarySettlements;

public interface SalarySettlementsMapper {
	int deleteByPrimaryKey(Long salarySettlementId);

	int insert(SalarySettlements record);

	int insertSelective(SalarySettlements record);

	SalarySettlements selectByPrimaryKey(Long salarySettlementId);

	int updateByPrimaryKeySelective(SalarySettlements record);

	int updateByPrimaryKey(SalarySettlements record);

	List<SalarySettlements> selectBySelective(SalarySettlements salarySettlementsSelect);

	List<SalarySettlements> selectAll();
	
	

	List<SalarySettlements> selectDistinctDept();

	List<SalarySettlements> selectAllDate();

	
	
}