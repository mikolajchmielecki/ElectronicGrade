package com.example.ElectronicGrade.model.service;

import com.example.ElectronicGrade.model.Address;
import com.example.ElectronicGrade.model.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressService {

    @Autowired
    private AddressRepository bookRepository;

    public List<Address> list() {
        return bookRepository.findAll();
    }
}