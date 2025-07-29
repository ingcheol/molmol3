package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustRepository extends SmRepository<Cust, String> {
}
