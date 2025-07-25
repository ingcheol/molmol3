package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustRepository extends SmRepository<Cust, String> {
    // SmRepository에 정의된 메서드들을 그대로 사용
}
