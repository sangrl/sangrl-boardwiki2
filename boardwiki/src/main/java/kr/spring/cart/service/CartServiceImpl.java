package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.cart.dao.CartMapper;
import kr.spring.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService{

	@Autowired
	CartMapper cartMapper;

	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}

	@Override
	public void updateCart(CartVO cart) {
		cartMapper.updateCart(cart);
	}

	@Override
	public List<CartVO> selectCartList(Map<String, Object> map) {
		return cartMapper.selectCartList(map);
	}

	@Override
	public Integer selectRowCount(Map<String, Object> map) {
		return cartMapper.selectRowCount(map);
	}
	@Override
	public void updateCart2(CartVO cart) {
		cartMapper.updateCart2(cart);

	}
	@Override
	public CartVO getCart(CartVO cart) {
		return cartMapper.getCart(cart);
	}

	@Override
	public CartVO selectCart(Long mem_num) {
		return cartMapper.selectCart(mem_num);
	}
	@Override
	public void deleteSmallCart(CartVO cart) {
		cartMapper.deleteSmallCart(cart);
	}

	@Override
	public void updateCartDate(Long mem_num) {
		cartMapper.updateCartDate(mem_num);
	}

	@Override
	public List<CartVO> selectCartList2(Long mem_num) {
		return cartMapper.selectCartList2(mem_num);
	}

	@Override
	public List<CartVO> selectname(Map<String, Object> map) {
		return cartMapper.selectname(map);
	}

}
