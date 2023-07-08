package com.fpoly.service;

import com.fpoly.dto.InvoiceDTO;
import com.fpoly.entity.Invoice;
import com.fpoly.entity.User;

import java.util.List;
import java.util.UUID;

public interface InvoiceService {

  InvoiceDTO save(Invoice invoice, User user);

  String prefixCode();

  List<InvoiceDTO> findInvoiceByUser(UUID userID);

  InvoiceDTO findInvoiceByCode(String code);

  InvoiceDTO saveDefault(InvoiceDTO invoice);
}
