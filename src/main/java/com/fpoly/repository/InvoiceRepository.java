package com.fpoly.repository;

import com.fpoly.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, UUID> {

  @Query("select c from Invoice c left join fetch c.invoiceDetails where c.user.id = ?1 order by c.createdDate DESC")
  List<Invoice> findInvoiceByUser(UUID userID);

  @Query(nativeQuery = true, value = "SELECT MAX(TRY_CAST(SUBSTRING(code, 5, LEN(code) - 4) AS INT)) + 1\n" +
          "FROM Invoice")
  String invoiceCodePrefixGenerateSQL();

  @Query("select c from Invoice c left join fetch c.invoiceDetails where c.code = ?1")
  Invoice findInvoiceByCode(String code);
}
