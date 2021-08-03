package com.hui.modules.member.domain;

import com.hui.base.BaseEntity;
import com.hui.modules.system.domain.Dict;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author xu.ze.wei
 * @date 7/27/21
 */
@Entity
@Getter
@Setter
@Table(name="ts_account")
public class Account extends BaseEntity implements Serializable {
    @Id
    @Column(name = "account_id")
    @NotNull(groups = Update.class)
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JoinColumn(name = "member_id")
    @ManyToOne(fetch=FetchType.LAZY)
    @ApiModelProperty(value = "会员", hidden = true)
    private Member member;

    @NotBlank
    @ApiModelProperty(value = "账户业务Id")
    private String accountCustomerId;

    @NotBlank
    @ApiModelProperty(value = "支付密码")
    private String payPassword;


    @NotBlank
    @ApiModelProperty(value = "余额")
    private BigDecimal balance;

    @NotBlank
    @ApiModelProperty(value = "冻结金额")
    private BigDecimal frozenAmount;

    @NotBlank
    @ApiModelProperty(value = "账户类型")
    private String accountType;

}
