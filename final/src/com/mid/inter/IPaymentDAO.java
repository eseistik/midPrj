package com.mid.inter;

import java.sql.SQLException;

import com.mid.dto.PaymentDTO;

public interface IPaymentDAO
{
	public PaymentDTO list(String cc_id)  throws SQLException;
	public int ingprice(String cc_id) throws SQLException;
	public int etcprice(String cc_id) throws SQLException;
}
