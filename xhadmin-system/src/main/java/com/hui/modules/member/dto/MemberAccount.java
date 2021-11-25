package com.hui.modules.member.dto;

import lombok.*;
import sun.nio.cs.ext.Big5;

import java.math.BigDecimal;

/**
 * @author xu.ze.wei
 * @date 11/25/21
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberAccount {

    //积分值
    private BigDecimal integralValue;

    //账户值
    private BigDecimal poolValue;

    //红包值
    private BigDecimal redPackageValue;
}
