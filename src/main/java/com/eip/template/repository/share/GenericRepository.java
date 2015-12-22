package com.eip.template.repository.share;

import java.util.List;

/**
 * DAO Base Interface Class.
 * @author AhnJungMin
 * @param <T>
 */
public interface GenericRepository<T>
{
    /**
     * [C] Insert Entity
     * @param entity
     * @return
     */
    T insert(T entity);
    
    /**
     * [R] Get All
     * @return
     */
    List<T> getAll();
    
    /**
     * [R] Get Entity
     * @param idx
     * @return
     */
    T get(T entity);
    
    /**
     * [R] Search Entity
     * @param name
     * @return
     */
    
    /**
     * [R] Get Data Count
     * @return
     */
    long count();
    
    /**
     * [U] Update Entity
     * @param entity
     * @return
     */
    int update(T entity);
    
    /**
     * [D] Delete Entity
     * @param idx
     */
    int delete(T entity);
    
    /**
     * [D] Delete All Data
     * @return
     */
    int deleteAll();

}
