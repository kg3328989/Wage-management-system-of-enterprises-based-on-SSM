package cn.com.smer.dtoform;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DateDepartmentsForm {
	private Long departmentId;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date importDate;
	private Long sumSalary = new Long(0);
	private Long maxSalary = new Long(0);
	private Long minSalary = new Long(1000000);
	private Double avgSalary = new Double(0.0);
	@Override
	public String toString() {
		return "DateDepartmentsForm [employeeId=" + departmentId + ", importDate=" + importDate + ", sumSalary="
				+ sumSalary + ", maxSalary=" + maxSalary + ", minSalary=" + minSalary + ", avgSalary=" + avgSalary
				+ "]";
	}
	public Long getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}
	public Date getImportDate() {
		return importDate;
	}
	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}
	public Long getSumSalary() {
		return sumSalary;
	}
	public void setSumSalary(Long sumSalary) {
		this.sumSalary = sumSalary;
	}
	public Long getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(Long maxSalary) {
		this.maxSalary = maxSalary;
	}
	public Long getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(Long minSalary) {
		this.minSalary = minSalary;
	}
	public Double getAvgSalary() {
		return avgSalary;
	}
	public void setAvgSalary(Double avgSalary) {
		this.avgSalary = avgSalary;
	}

	
}
