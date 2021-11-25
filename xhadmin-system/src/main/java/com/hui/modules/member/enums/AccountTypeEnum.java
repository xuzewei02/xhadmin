package com.hui.modules.member.enums;

/**
 * @author xu.ze.wei
 * @date 11/25/21
 */
public enum AccountTypeEnum {
    POOL("POOL","用户APP账户"),
    INTEGRAL("INTEGRAL","积分账户"),
    RP("RP","用户红包账户");

    private String code;

    private String desc;

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    AccountTypeEnum() {
    }

    AccountTypeEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static boolean isPoolAccount(String accountCode){
        return POOL.getCode().equals(accountCode);
    }

    public static boolean isRedPackageAccount(String accountCode){
        return RP.getCode().equals(accountCode);
    }

    public static boolean isIntegralAccount(String accountCode){
        return INTEGRAL.getCode().equals(accountCode);
    }

}
