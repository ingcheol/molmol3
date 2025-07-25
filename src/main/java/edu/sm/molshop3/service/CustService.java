package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.repository.CustRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustService {

    @Autowired
    CustRepository custRepository;

    public void register(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    public void remove(String custId) throws Exception {
        custRepository.delete(custId);
    }

    public Cust get(String custId) throws Exception {
        return custRepository.select(custId);
    }

    public List<Cust> get() throws Exception {
        return custRepository.selectAll();
    }

    public Cust login(String custId, String custPwd) throws Exception {
        Cust cust = custRepository.select(custId);
        if (cust != null && cust.getCust_pwd().equals(custPwd)) {
            return cust;
        }
        return null;
    }
}
