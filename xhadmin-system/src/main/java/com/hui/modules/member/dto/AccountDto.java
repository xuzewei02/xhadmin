package com.hui.modules.member.dto;

import com.hui.base.BaseDTO;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author xu.ze.wei
 * @date 7/28/21
 */
@Getter
@Setter
public class AccountDto extends BaseDTO implements Serializable {

    private Long id;

    private MemberSmallDto member;

    private String accountCustomerId;

    private String payPassword;

    private Long memberId;

    private BigDecimal balance;

    private BigDecimal frozenAmount;

    private String accountType;
}
