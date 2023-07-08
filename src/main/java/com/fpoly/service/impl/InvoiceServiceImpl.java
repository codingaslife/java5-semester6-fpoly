package com.fpoly.service.impl;

import com.fpoly.dto.InvoiceDTO;
import com.fpoly.entity.Invoice;
import com.fpoly.entity.User;
import com.fpoly.repository.InvoiceRepository;
import com.fpoly.service.InvoiceService;
import com.fpoly.utils.ObjectPrefixCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class InvoiceServiceImpl implements InvoiceService {

  @Autowired
  private InvoiceRepository invoiceRepository;

  @Autowired
  private ModelMapper modelMapper;

  //  @Override
//  public List<UserDTO> getAll() {
//    return cartRepository.getAll().stream().map(u -> modelMapper.map(u, UserDTO.class)).collect(Collectors.toList());
//  }
  @Override
  public InvoiceDTO saveDefault(InvoiceDTO invoiceDTO) {
    Invoice invoiceConvertToEntity = modelMapper.map(invoiceDTO, Invoice.class);
    Invoice save = invoiceRepository.save(invoiceConvertToEntity);
    InvoiceDTO invoiceResponse = modelMapper.map(save, InvoiceDTO.class);
    return invoiceResponse;
  }

  @Override
  public InvoiceDTO save(Invoice invoice, User user) {
    invoice.setCode(prefixCode());
    invoice.setCreatedDate(new Date());
    invoice.setState(0);
    invoice.setUser(user);
    invoice.setShipFee(new BigDecimal("30000"));
    Invoice newInvoice = invoiceRepository.save(invoice);
    InvoiceDTO invoiceResponse = modelMapper.map(invoice, InvoiceDTO.class);
    return invoiceResponse;
  }

  @Override
  public String prefixCode() {
    return invoiceRepository.findAll().isEmpty() ? ObjectPrefixCode.INVOICE_CODE + 1 : ObjectPrefixCode.INVOICE_CODE + invoiceRepository.invoiceCodePrefixGenerateSQL();
  }

  @Override
  public List<InvoiceDTO> findInvoiceByUser(UUID userID) {
    return invoiceRepository.findInvoiceByUser(userID).stream().map(i -> modelMapper.map(i, InvoiceDTO.class)).collect(Collectors.toList());
  }

  @Override
  public InvoiceDTO findInvoiceByCode(String code) {
    Invoice invoice = invoiceRepository.findInvoiceByCode(code);
    if (invoice == null) {
      return null;
    }
    InvoiceDTO invoiceResponse = modelMapper.map(invoice, InvoiceDTO.class);
    return invoiceResponse;
  }
}
