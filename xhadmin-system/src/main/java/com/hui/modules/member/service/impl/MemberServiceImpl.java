package com.hui.modules.member.service.impl;

import com.hui.modules.member.domain.Member;
import com.hui.modules.member.dto.MemberDto;
import com.hui.modules.member.dto.MemberQueryCriteria;
import com.hui.modules.member.repository.MemberRepository;
import com.hui.modules.member.service.MemberService;
import com.hui.modules.member.service.mapstruct.MemberMapper;
import com.hui.utils.PageUtil;
import com.hui.utils.QueryHelp;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author xu.ze.wei
 */
@Service
@RequiredArgsConstructor
@CacheConfig(cacheNames = "member")
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberMapper memberMapper;

    /**
     * 会员信息 --分页
     * @param member 条件
     * @param pageable 分页参数
     * @return
     */
    @Override
    public Map<String, Object> queryAll(MemberQueryCriteria member, Pageable pageable){
        Page<Member> page = memberRepository.findAll((root, query, cb) -> QueryHelp.getPredicate(root, member, cb), pageable);
        return PageUtil.toPage(page.map(memberMapper::toDto));
    }

    /**
     * 会员信息 --全部
     *
     * @param member
     * @return
     */
    @Override
    public List<MemberDto> queryAll(MemberQueryCriteria member) {
        List<Member> memberList = memberRepository.findAll((root, query, cb) -> QueryHelp.getPredicate(root, member, cb));
        return memberMapper.toDto(memberList);
    }



}
