package com.hui.modules.member.rest;

import com.hui.modules.member.dto.MemberDto;
import com.hui.modules.member.dto.MemberQueryCriteria;
import com.hui.modules.member.service.MemberService;
import com.hui.modules.system.service.dto.DictQueryCriteria;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author xu.ze.wei
 * 会员管理 --面向C端 系统的客户管理  非后台运营人员
 */
@RestController
@RequiredArgsConstructor
@Api(tags = "会员：会员管理")
@RequestMapping("/api/member")
public class MemberController {

    private final MemberService memberService;

    @ApiOperation("查询会员列表")
    @GetMapping(value = "/all")
    public ResponseEntity<Object> queryAll(MemberQueryCriteria criteria) {
        List<MemberDto> result = memberService.queryAll(criteria);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @ApiOperation("查询会员列表")
    @GetMapping
    public ResponseEntity<Object> query(MemberQueryCriteria resources, Pageable pageable){
        return new ResponseEntity<>(memberService.queryAll(resources,pageable),HttpStatus.OK);
    }


}
