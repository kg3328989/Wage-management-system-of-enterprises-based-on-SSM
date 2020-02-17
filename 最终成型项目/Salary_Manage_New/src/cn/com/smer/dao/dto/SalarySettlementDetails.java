package cn.com.smer.dao.dto;

public class SalarySettlementDetails extends SalarySettlementDetailsKey {
    private Long money;

    private Short addorsubtract;

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
}