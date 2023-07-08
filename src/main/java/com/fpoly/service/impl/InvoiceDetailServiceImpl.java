package com.fpoly.service.impl;

import com.fpoly.dto.InvoiceDetailDTO;
import com.fpoly.entity.CartDetail;
import com.fpoly.entity.Invoice;
import com.fpoly.entity.InvoiceDetail;
import com.fpoly.repository.InvoiceDetailRepository;
import com.fpoly.service.InvoiceDetailService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class InvoiceDetailServiceImpl implements InvoiceDetailService {

  @Autowired
  private InvoiceDetailRepository invoiceDetailRepository;

  @Autowired
  private ModelMapper modelMapper;

//  @Override
//  public List<UserDTO> getAll() {
//    return cartRepository.getAll().stream().map(u -> modelMapper.map(u, UserDTO.class)).collect(Collectors.toList());
//  }

  @Override
  public List<InvoiceDetailDTO> findInvoiceDetailByInvoice(UUID invoiceId) {
    return invoiceDetailRepository.findInvoiceDetailByInvoice(invoiceId).stream().map(i -> modelMapper.map(i, InvoiceDetailDTO.class)).collect(Collectors.toList());
  }

  @Override
  public Boolean deleteCartItemByCartAfterPayment(UUID id) {
    return null;
  }

  @Override
  public void save(Invoice invoice, List<CartDetail> cartDetails) {
    for (CartDetail c : cartDetails) {
      InvoiceDetail newInvoiceDetail = new InvoiceDetail();
      newInvoiceDetail.setInvoice(invoice);
      newInvoiceDetail.setProduct(c.getProduct());
      newInvoiceDetail.setPrice(c.getPrice());
      newInvoiceDetail.setQuantity(c.getQuantity());
      invoiceDetailRepository.save(newInvoiceDetail);
    }
  }

}
