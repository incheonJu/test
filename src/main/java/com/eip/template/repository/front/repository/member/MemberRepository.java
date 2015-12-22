package com.eip.template.repository.front.repository.member;

import com.eip.template.domain.share.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {
    Member findByMemberSeq();
    Member findByMemberId();
}