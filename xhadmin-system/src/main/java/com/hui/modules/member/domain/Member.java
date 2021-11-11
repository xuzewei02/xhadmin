/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.hui.modules.member.domain;

import com.hui.base.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

/**
* @author xu.ze.wei
* @date 2021-07-29
*/
@Entity
@Getter
@Setter
@Table(name="ts_member")
public class Member extends BaseEntity implements Serializable {

    @Id
    @Column(name = "member_id")
    @NotNull(groups = Update.class)
    @ApiModelProperty(value = "ID", hidden = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "member",cascade={CascadeType.PERSIST,CascadeType.REMOVE})
    private List<Account> accounts;

    @NotBlank
    @ApiModelProperty(value = "会员业务Id")
    private String memberCustomerId;

    @NotNull
    @ApiModelProperty(value = "手机号码")
    private String mobileNumber;

    @NotNull
    @ApiModelProperty(value = "登录密码")
    private String password;

    @NotNull
    @ApiModelProperty(value = "证件类型")
    private String identityType;

    @NotNull
    @ApiModelProperty(value = "证件号码")
    private String identityNumber;

    @ApiModelProperty(value = "姓名")
    private String name;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "系统生成唯一用户名")
    private String userName;

    @NotNull
    @ApiModelProperty(value = "渠道(SELF:自营)")
    private String userChannel;

    @NotNull
    @ApiModelProperty(value = "性别")
    private String sex;

    @NotNull
    @ApiModelProperty(value = "邮箱")
    private String email;

    @Column(name = "birthday_date")
    @ApiModelProperty(value = "出生日期(生日)", hidden = true)
    private Timestamp birthdayDate;

    @NotNull
    @ApiModelProperty(value = "用户类型(EU:企业用户;CU:个人用户)")
    private String userType;

    @NotNull
    @ApiModelProperty(value = "状态 ENABLE:有效;DISABLE:无效")
    private Boolean status;

    @NotNull
    @ApiModelProperty(value = "微信union_id")
    private String wcUnionId;

    @NotNull
    @ApiModelProperty(value = "支付宝union_id")
    private String alUnionId;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Member member = (Member) o;
        return Objects.equals(id, member.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}