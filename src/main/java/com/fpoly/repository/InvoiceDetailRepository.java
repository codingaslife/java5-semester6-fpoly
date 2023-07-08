package com.fpoly.repository;

import com.fpoly.entity.InvoiceDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface InvoiceDetailRepository extends JpaRepository<InvoiceDetail, UUID> {

  @Query("select i from InvoiceDetail i left join fetch i.invoice left join fetch i.product where i.invoice.id = ?1")
  List<InvoiceDetail> findInvoiceDetailByInvoice(UUID invoiceId);

}
