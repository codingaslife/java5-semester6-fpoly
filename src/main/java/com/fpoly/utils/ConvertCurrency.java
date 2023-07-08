package com.fpoly.utils;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class ConvertCurrency {
  public static String FormatCurrencyVND(BigDecimal productPrice) {
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
    String formattedValue = formatter.format(productPrice);
    return formattedValue;
  }
}
