package cn.com.smer.dtoform;

public class SalarySettlementDetailsForm {
	private Long salarySettlementId;

	private Long projectId;

	private String projectName;

	private Long money;

	private Short addorsubtract;

	public Long getSalarySettlementId() {
		return salarySettlementId;
	}

	public void setSalarySettlementId(Long salarySettlementId) {
		this.salarySettlementId = salarySettlementId;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getMoney() {
		return money;
	}

	public void setMoney(Long money) {
		this.money = money;
	}

	public Short getAddorsubtract() {
		return addorsubtract;
	}

	public void setAddorsubtract(Short addorsubtract) {
		this.addorsubtract = addorsubtract;
	}

	@Override
	public String toString() {
		return "SalarySettlementDetailsForm [salarySettlementId=" + salarySettlementId + ", projectId=" + projectId
				+ ", projectName=" + projectName + ", money=" + money + ", addorsubtract=" + addorsubtract + "]";
	}

}
