package com.biz.dbms.service;

import java.util.List;

import com.biz.dbms.config.Lines;
import com.biz.dbms.domain.OrderVO;

public class OrderView {
	
	// List<OrderVO> orderList;
	// 위와 같이 orderList를 필드변수로 선언하여 다른 메서들과 공유를 하면 결합도가 높아진다.
	// 따라서 아래 orderList(List<OrderVO> orderList)와 같이 List<OrderVO> orderList를 매개변수로 받아 처리하는 것이 가장 깔끔하다!
	public void orderList(List<OrderVO> orderList) {
			
		System.out.println(Lines.dLine);
		System.out.println("주문내역서");
		System.out.println(Lines.dLine);
		System.out.println("SEQ\t주문번호\t주문일자\t고객\t상품\t수량\t가격\t합계");
		System.out.println(Lines.sLine);
		
		for(OrderVO vo : orderList) {
			System.out.printf("%5d\t",vo.getO_seq());
			System.out.print(vo.getO_num() + "\t\t");
			System.out.print(vo.getO_date() + "\t");
			System.out.print(vo.getO_cnum() + "\t");
			System.out.print(vo.getO_pcode() + "\t");
			System.out.print(vo.getO_qty() + "\t");
			System.out.print(vo.getO_price() + "\t");
			System.out.print(vo.getO_total() + "\n");
		}
		System.out.println(Lines.dLine);
	} // end orderList
	
	public void orderDetailView(OrderVO orderVO) {

		System.out.println("================================");
		System.out.printf("주문번호 : %s\n", orderVO.getO_num());
		System.out.printf("고객번호 : %s\n", orderVO.getO_cnum());
		System.out.printf("상품코드 : %s\n", orderVO.getO_pcode());
		System.out.printf("가    격 : %d\n", orderVO.getO_price());
		System.out.printf("수    량 : %d\n", orderVO.getO_qty());
		System.out.println("================================");

	}

}
