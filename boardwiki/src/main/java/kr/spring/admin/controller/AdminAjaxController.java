package kr.spring.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.service.BoardService;
import kr.spring.member.service.MemberService;
import kr.spring.team.service.TeamService;
import kr.spring.tnrboard.service.TnrboardService;
import kr.spring.used.service.UsedService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminAjaxController {

	@Autowired
	BoardService boardService;

	@Autowired
	UsedService usedService;

	@Autowired
	TeamService teamService;

	@Autowired
	TnrboardService tnrBoardService;

	@Autowired
	MemberService memberService;
	//등급 처리
	@PostMapping("/adminPage/changeAuth")
	@ResponseBody
	public Map<String,String> changeAuth(
			Long report_type, Long use_num,Long use_auth,
			Long tea_num,Long tea_status,Long boa_num,
			Long boa_auth,Long tnr_num, Long tnr_auth){
		log.debug("report_type" + report_type);
		log.debug("boa_num" + boa_num);
		log.debug("boa_auth" + boa_auth);

		Map<String,String> mapJson = new HashMap<>();

		if(report_type == 1 ) {
			boardService.updateBoardAuth(boa_num, boa_auth);
			mapJson.put("result", "success");
		}else if(report_type == 5) {
			usedService.updateUsedAuth(use_auth, use_num);
			mapJson.put("result", "success");
		}else if(report_type == 6) {
			teamService.updateTeamAuth(tea_status, tea_num);
			mapJson.put("result", "success");
		}else if(report_type == 7) {
			tnrBoardService.updateTnrBoardAuth(tnr_num, tnr_auth);
			mapJson.put("result", "success");
		}else {
			mapJson.put("result", "error");

		}

		return mapJson;
	}

	@PostMapping("/adminPage/updateMemberAuth")
	@ResponseBody
	public Map<String, Object> updateMemberAuth(
	        @RequestParam Long mem_num,
	        @RequestParam Integer mem_auth) {
	    Map<String, Object> mapJson = new HashMap<>();

	    log.debug("<<등급수정 시도>> mem_num: " + mem_num + ", mem_auth: " + mem_auth);

	    // 회원의 등급을 업데이트하는 서비스 메서드를 호출
	    boolean success = memberService.updateMemberAuth(mem_num, mem_auth);

	    if (success) {
	        mapJson.put("result", "success");
	    } else {
	        mapJson.put("result", "error");
	    }
	    return mapJson;
	}
}
