package com.eip.template.common.generic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.eip.template.common.util.ResultMessage;
import org.springframework.util.MultiValueMap;

/**
 * Service Base Interface Class
 */
public interface GenericService<T>
{
    /**
     * New Data Insert(새로운 데이터 추가)
     * @param entity
     * @return
     */
    ResultMessage insert(T entity);

    /**
     * Data Update(기존 데이터 값 수정)
     * @param entity
     * @return
     */
    ResultMessage update(T entity);

    /**
     * Delete Data(데이터 삭제)
     * @param idx
     */
    ResultMessage delete(T entity);

    /**
     * Get Single Information by Idx Number(int형 인덱스 값으로 단일 정보 요청)
     * @param entity
     * @return
     */
    ResultMessage get(T entity);

     /**
     * Get All Information Data(모든 데이터 요청)
     * @return
     */
    ResultMessage getAll();

    /**
     * [R] Get All(Map<String, Object> parameters)
     * @return
     */
    ResultMessage getList(Map<String, Object> parameters);

    /**
     * 쿼리스트링
     * @return
     */
    Map<String, Object> setQuery(HttpServletRequest request, String mode);

    /**
     * @param Map
     * @return
     */
}