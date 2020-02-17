package cn.com.smer.dtoform;

import java.math.BigDecimal;

public class CalculationsForm {
	  private Long calculationId;

	    private Long projectId;

	    private String operator;

	    private BigDecimal operandtwo;

	    public Long getCalculationId() {
	        return calculationId;
	    }

	    public void setCalculationId(Long calculationId) {
	        this.calculationId = calculationId;
	    }

	    public Long getProjectId() {
	        return projectId;
	    }

	    public void setProjectId(Long projectId) {
	        this.projectId = projectId;
	    }

	    public String getOperator() {
	        return operator;
	    }

	    public void setOperator(String operator) {
	        this.operator = operator == null ? null : operator.trim();
	    }

	    public BigDecimal getOperandtwo() {
	        return operandtwo;
	    }

	    @Override
		public String toString() {
			return "CalculationsForm [calculationId=" + calculationId + ", projectId=" + projectId + ", operator="
					+ operator + ", operandtwo=" + operandtwo + "]";
		}

		public void setOperandtwo(BigDecimal operandtwo) {
	        this.operandtwo = operandtwo;
	    }
}
