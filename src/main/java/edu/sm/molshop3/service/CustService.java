package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.CustDto;
import edu.sm.molshop3.repository.CustRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustService {

    @Autowired
    CustRepository custRepository;

    public CustDto login(String id, String pw) {
        CustDto cust = custRepository.findById(id);
        if (cust != null && cust.getPw().equals(pw)) {
            return cust;
        }
        return null;
    }
}
