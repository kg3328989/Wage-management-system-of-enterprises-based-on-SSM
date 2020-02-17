package cn.com.smer.dao.inter;

import java.util.List;

import cn.com.smer.dao.dto.SalarySettlementDetails;
import cn.com.smer.dao.dto.SalarySettlementDetailsKey;

public interface SalarySettlementDetailsMapper {
    int deleteByPrimaryKey(Long long1);

    int insert(SalarySettlementDetails record);

    int insertSelective(SalarySettlementDetails record);

    SalarySettlementDetails selectByPrimaryKey(SalarySettlementDetailsKey key);

    int updateByPrimaryKeySelective(SalarySettlementDetails record);

    int updateByPrimaryKey(SalarySettlementDetails record);

	List<SalarySettlementDetails> selectBySalarySettlementId(Long salarySettlementId);
	
	/*sxb新增项目*/
	List<SalarySettlementDetails> selectBySSId(Long salarySettlementId);
	
	
	
}