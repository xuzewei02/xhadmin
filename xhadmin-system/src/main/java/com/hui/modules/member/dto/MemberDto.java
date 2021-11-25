package com.hui.modules.member.dto;

import com.hui.base.BaseDTO;
import com.hui.modules.member.domain.Account;
import com.hui.modules.member.domain.Member;
import com.hui.modules.member.enums.AccountTypeEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Function;

/**
 * @author xu.ze.wei
 * @date 7/28/21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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

    private Boolean status;

    private String wcUnionId;

    private String alUnionId;

    private MemberAccount memberAccount;

    /**
     * member -> memberDto
     *
     * @return
     */
    public static Function<Member, MemberDto> toMemberManagerResult() {
        return memberDto -> builder()
                .id(memberDto.getId())
                .memberCustomerId(memberDto.getMemberCustomerId())
                .accounts(accountListToAccountDtoList(memberDto.getAccounts()))
                .mobileNumber(memberDto.getMobileNumber())
                .password(memberDto.getPassword())
                .identityType(memberDto.getIdentityType())
                .identityNumber(memberDto.getIdentityNumber())
                .name(memberDto.getName())
                .nickName(memberDto.getNickName())
                .userName(memberDto.getUserName())
                .userChannel(memberDto.getUserChannel())
                .sex(memberDto.getSex())
                .email(memberDto.getEmail())
                .birthdayDate(memberDto.getBirthdayDate())
                .userType(memberDto.getUserType())
                .status(memberDto.getStatus())
                .wcUnionId(memberDto.getWcUnionId())
                .alUnionId(memberDto.getAlUnionId())
                .memberAccount(getMemberAccount(memberDto.getAccounts()))
                .build();
    }

    private static MemberAccount getMemberAccount(List<Account> accounts) {
        MemberAccount.MemberAccountBuilder builder = MemberAccount.builder();
        for (Account account : accounts) {
            if (AccountTypeEnum.isPoolAccount(account.getAccountType())) {
                builder.poolValue(account.getBalance());
            }
            if (AccountTypeEnum.isIntegralAccount(account.getAccountType())) {
                builder.integralValue(account.getBalance());
            }
            if (AccountTypeEnum.isRedPackageAccount(account.getAccountType())) {
                builder.redPackageValue(account.getBalance());
            }
        }
        return builder.build();
    }

    private static List<AccountDto> accountListToAccountDtoList(List<Account> list) {
        if (list == null) {
            return null;
        }
        List<AccountDto> list1 = new ArrayList<AccountDto>(list.size());
        for (Account account : list) {
            list1.add(accountToAccountDto(account));
        }
        return list1;
    }

    private static AccountDto accountToAccountDto(Account account) {
        if (account == null) {
            return null;
        }

        AccountDto accountDto = new AccountDto();
        accountDto.setCreateBy(account.getCreateBy());
        accountDto.setUpdatedBy(account.getUpdatedBy());
        accountDto.setCreateTime(account.getCreateTime());
        accountDto.setUpdateTime(account.getUpdateTime());
        accountDto.setId(account.getId());
        accountDto.setMember(memberToMemberSmallDto(account.getMember()));
        accountDto.setAccountCustomerId(account.getAccountCustomerId());
        accountDto.setPayPassword(account.getPayPassword());
        accountDto.setBalance(account.getBalance());
        accountDto.setFrozenAmount(account.getFrozenAmount());
        accountDto.setAccountType(account.getAccountType());
        return accountDto;
    }

    private static MemberSmallDto memberToMemberSmallDto(Member member) {
        if (member == null) {
            return null;
        }
        MemberSmallDto memberSmallDto = new MemberSmallDto();
        memberSmallDto.setId(member.getId());
        return memberSmallDto;
    }
}
