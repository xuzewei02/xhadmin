package com.hui.modules.member.service;

import com.hui.modules.member.dto.MemberDto;
import com.hui.modules.member.dto.MemberQueryCriteria;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * @author xu.ze.wei
 */
public interface MemberService {

    /**
     * 分页查询
     * @param member 条件
     * @param pageable 分页参数
     * @return /
     */
    Map<String, Object> queryAll(MemberQueryCriteria member, Pageable pageable);

    /**
     * 查询全部数据
     * @param criteria
     * @return
     */
    List<MemberDto> queryAll(MemberQueryCriteria criteria);
}
