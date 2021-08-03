package com.hui.modules.member.dto;

import com.hui.base.BaseDTO;
import com.hui.modules.member.domain.Account;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author xu.ze.wei
 * @date 7/28/21
 */
@Getter
@Setter
public class MemberDto extends BaseDTO implements Serializable {

    private Long id;

    private String memberCustomerId;

    private List<AccountDto> accounts;

    private String mobileNumber;

    private String password;

    private String identityType;

    private String identityNumber;

    private String name;

    private String nickName;

    private String userName;

    private String userChannel;

    private String sex;

    private String email;

    private Date birthdayDate;

    private String userType;

    private String status;

    private String wcUnionId;

    private String alUnionId;
}
