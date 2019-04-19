package Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;

import Dao.GovernanceDao;
import ServiceInterface.GovernanceService;

@Service
public class GoverananceServiceImpl implements GovernanceService {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Bean
	public void jdbcTemplate(DataSource dataSource) {
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	
	
	@Override
	public int addGoverance(GovernanceDao gov) {
		String sql="insert into TBLGOVERNANCEDETAILS (PROJECTID,PROJECTNAME,CALLDATE,PARTICIPANTSNAMES,MOM,MODIFYBY,DOCTYPE,SUBJECT) VALUES(?,?,?,?,?,?,?,?)";
		int result=0;
		
			result=jdbcTemplate.update(sql,new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setInt(1, gov.getProjectid());
					ps.setString(2, gov.getProjectname());
					ps.setDate(3, gov.getCalldate());
					ps.setString(4, gov.getParticipantsnames());
					ps.setString(5, gov.getMom());
					ps.setString(6, gov.getModifyby());
					ps.setString(7, gov.getDoctype());
					ps.setString(8, gov.getSubject());
					
				}
			});
	
		
		return result;
	}

	@Override
	public int updateGoverance(GovernanceDao gov) {
		String sql="update TBLGOVERNANCEDETAILS set PROJECTID=?,PROJECTNAME=?,CALLDATE=?,PARTICIPANTSNAMES=?,MOM=?,MODIFYBY=?,DOCTYPE=?,SUBJECT=? where GVID=? ";
		
		int result=jdbcTemplate.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, gov.getProjectid());
				ps.setString(2, gov.getProjectname());
				ps.setDate(3, gov.getCalldate());
				ps.setString(4, gov.getParticipantsnames());
				ps.setString(5, gov.getMom());
				ps.setString(6, gov.getModifyby());
				ps.setString(7, gov.getDoctype());
				ps.setString(8, gov.getSubject());
				ps.setInt(9, gov.getGvid());
				
				
			}
		});
		
		return result;
	}

	@Override
	public GovernanceDao getGovernanceById(int gvid) {
		String sql="Select * from  TBLGOVERNANCEDETAILS where gvid=?";
		GovernanceDao gov=(GovernanceDao) jdbcTemplate.queryForObject(sql, new Object[] {gvid},new BeanPropertyRowMapper(GovernanceDao.class));
		return gov;
	}

	@Override
	public ArrayList<GovernanceDao> getAllGoverance() {
		String sql="select * from TBLGOVERNANCEDETAILS order by gvid";
		ArrayList<GovernanceDao> listGov=(ArrayList<GovernanceDao>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(GovernanceDao.class));
		
		return listGov;
	}

}
