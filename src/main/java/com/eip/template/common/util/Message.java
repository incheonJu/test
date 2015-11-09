package com.eip.template.common.util;

/**
 * Errors Code & Error Message enum Class.
 */
public enum Message
{
    SUCCUSS("100", "요청 작업 성공"),
    ERR_FAIL("200", "요청 작업 실패"),
    
    ERR_DUPLICATE_ID("201", "해당 아이디가 존재합니다."),
    ERR_NOUSER("202", "해당 아이디 정보가 없습니다."),
    ERR_PASSWORD("203", "패스워드가 일치하지 않습니다."),
    ERR_NODATA("204", "해당 데이터가 없습니다."),
    ERR_BAD_REQUEST("205", "잘못된 요청입니다."),
    ERR_NO_ACCEPT_OPER("206", "승인되지 않은 처리자입니다."),
    ERR_DELETE_USER_DATA("207", "탈퇴처리된 사용자입니다."),
    
    ERR_NO_RECIPIENT_DATA("300", "등록된 수요자가 없습니다."),
    ERR_DUPLICATE_RECIPIENT("301", "이미 등록된 수요자 입니다."),
    ERR_REQUEST_ALREADY_GRANTED("302", "이미 처리된 요청입니다."),
    ERR_DISALLOW_REQUESTS("303", "이미 사용 불허된 요청입니다."),
    ERR_REQUESTS_EXCESS("304", "초과된 요청 입니다."),
    ERR_DUPLICATE_DATA("305", "이미 등록된 요청입니다."),
    
    ERR_CERTIFICATION_KEY_NOT_MATCH("401", "입력하신 아이디와 실명 인증정보가 맞지 않습니다."),
    ERR_CERTIFICATION_KEY_NOT("402", "해당 실명 인증정보로 가입된 회원정보가 없습니다."),
    
    ERR_USER_EXISTS_ORGAN("501", "해당 소속에 등록된 사용자가 있으므로 삭제가 불가능 합니다."),
    ERR_USER_EXISTS_DEPART("502", "해당 부서에 등록된 사용자가 있으므로 삭제가 불가능 합니다.");
    
    private String code;
    private String message;
    
    Message(String code, String message)
    {
        this.code = code;
        this.message = message;
    }

    public String getCode()
    {
        return code;
    }

    public String getMessage()
    {
        return message;
    }
    
}
