package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.frame.SmService;
import edu.sm.molshop3.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements SmService<Cust, String> {

    final CustRepository custRepository;

    @Override
    public Cust get(String id) throws Exception {
        return custRepository.select(id);
    }

    @Override
    public void register(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    @Override
    public void remove(String id) throws Exception {
        custRepository.delete(id);
    }

    @Override
    public List<Cust> get() throws Exception {
        return custRepository.selectAll();
    }
}
