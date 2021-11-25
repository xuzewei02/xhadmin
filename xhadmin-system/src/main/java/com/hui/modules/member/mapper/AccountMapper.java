package com.hui.modules.member.mapper;


import com.hui.modules.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author xu.ze.wei
 * @date 8/10/21
 */
@Mapper
public interface AccountMapper {

    Member findMemberInfoById(String memberId);

}
