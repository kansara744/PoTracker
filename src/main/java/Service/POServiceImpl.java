package Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cache.CacheProperties.JCache;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;

import Dao.PODao;
import ServiceInterface.POService;

@Service
public class POServiceImpl implements POService {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Bean
	public void jdbcTemplate(DataSource dataSource) {
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	@Override
	public int addPO(PODao po) {
		String sql="Insert into TBLPO (PROJECTID,POTYPE,PONUMBER,PODATE,AMOUNT,STARTDATE,ENDDATE,HRCOST,THIRDPARTYCOST,WBSCODE,POFILE,MODIFYBY,PROJECTNAME) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		
		int result=jdbcTemplate.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, po.getProjectid());
				ps.setString(2, po.getPotype());
				ps.setString(3, po.getPonumber());
				ps.setDate(4, po.getPodate());
				ps.setString(5, po.getAmount());
				ps.setDate(6, po.getStartdate());
				ps.setDate(7, po.getEnddate());
				ps.setString(8, po.getHrcost());
				ps.setString(9, po.getThirdpartycost());
				ps.setString(10, po.getWbscode());
				ps.setString(11, po.getPofile());
				ps.setString(12, po.getModifyby());
				ps.setString(13, po.getProjectname());
				
				
			}
		});
		return result;
	}

	@Override
	public int updatePO(int id, PODao po) {
		String sql="update TBLPO set PROJECTID=?,POTYPE=?,PONUMBER=?,PODATE=?,AMOUNT=?,STARTDATE=?,ENDDATE=?,HRCOST=?,THIRDPARTYCOST=?,WBSCODE=?,POFILE=?,MODIFYBY=?,PROJECTNAME=? where POID=?";
		
		int result=jdbcTemplate.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, po.getProjectid());
				ps.setString(2, po.getPotype());
				ps.setString(3, po.getPonumber());
				ps.setDate(4, po.getPodate());
				ps.setString(5, po.getAmount());
				ps.setDate(6, po.getStartdate());
				ps.setDate(7, po.getEnddate());
				ps.setString(8, po.getHrcost());
				ps.setString(9, po.getThirdpartycost());
				ps.setString(10, po.getWbscode());
				ps.setString(11, po.getPofile());
				ps.setString(12, po.getModifyby());
				ps.setString(13, po.getProjectname());
				ps.setInt(14, po.getPoid());
			}
		});
		return result;	
	}

	@Override
	public PODao getPOByID(int id) {
		String sql="select * from TBLPO where POID=?";
		PODao po=(PODao) jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper(PODao.class));
		return po;
	}

	@Override
	public ArrayList<PODao> getAllPO() {
		String sql="select * from TBLPO order by poid";
		ArrayList<PODao> listPO=(ArrayList<PODao>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(PODao.class));
		return listPO;
	}

}
