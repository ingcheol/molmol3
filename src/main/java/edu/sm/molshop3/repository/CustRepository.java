package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.CustDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface CustRepository {
    @Select("SELECT * FROM cust WHERE id = #{id}")
    CustDto findById(String id);
}
