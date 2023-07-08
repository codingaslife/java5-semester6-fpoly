package com.fpoly.service;

import com.fpoly.dto.InvoiceDetailDTO;
import com.fpoly.entity.CartDetail;
import com.fpoly.entity.Invoice;

import java.util.List;
import java.util.UUID;

public interface InvoiceDetailService {
  List<InvoiceDetailDTO> findInvoiceDetailByInvoice(UUID invoiceId);

  Boolean deleteCartItemByCartAfterPayment(UUID id);

  void save(Invoice invoice, List<CartDetail> cartDetails);
}
