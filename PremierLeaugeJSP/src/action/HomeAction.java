package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LeagueTableManager;
import dao.LeagueTeamInfoDAO;
import dao.LeagueTeamInfoImpl;
import dao.MemberDAO;
import dao.MemberImpl;
import dto.LeagueTableBean;
import dto.LeagueTeamInfoBean;
import dto.MemberBean;
import jdbc.ConnectionProvider;

public class HomeAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		LeagueTableManager service= LeagueTableManager.getInstance();
		List<LeagueTableBean> tList = service.getList();
		request.setAttribute("leagueTable", tList);
		
		HttpSession session = request.getSession();
			
		String sessionId = (String) session.getAttribute("userId");
		
		if (sessionId == null || sessionId.equals("")) {
			request.setAttribute("sessionState", "none");
		} else {
			request.setAttribute("sessionState", "loggedIn");
			// request.setAttribute("teamId", teamId);
		}
				

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDAO service2 = new MemberImpl(conn);
			MemberBean idList = service2.selectList(sessionId);
			System.out.println(idList);
			
			if(idList != null) {
				LeagueTeamInfoDAO service3 = new LeagueTeamInfoImpl(conn);
				LeagueTeamInfoBean mtList = service3.selectMemberTeam(idList.getMyteam());
				
				request.setAttribute("memberTeam", mtList);
				System.out.println(mtList);
			}

		
		} catch (SQLException ex) {
			System.out.println("Fail to connection.");
		}
		
	}

	
}
