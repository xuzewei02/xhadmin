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
package com.hui.modules.member.service.mapstruct;


import com.hui.base.BaseMapper;
import com.hui.modules.member.domain.Member;
import com.hui.modules.member.dto.MemberDto;
import com.hui.modules.system.domain.User;
import com.hui.modules.system.service.dto.UserDto;
import com.hui.modules.system.service.mapstruct.DeptMapper;
import com.hui.modules.system.service.mapstruct.JobMapper;
import com.hui.modules.system.service.mapstruct.RoleMapper;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * @author xu.ze.wei
 * @date 2021-7-28
 */
@Mapper(componentModel = "spring",unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface MemberMapper extends BaseMapper<MemberDto, Member> {
}