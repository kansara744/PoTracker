package Service;

import java.sql.Date;
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

import Dao.ProjectDao;
import ServiceInterface.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Bean
	public void jdbcTemplate(DataSource dataSource) {
		//System.out.println("DataSource "+dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);
		//System.out.println("Jdbc Template is "+jdbcTemplate);
	}

	public ProjectDao getProjectById(int id) {
		String sql="select * from tblproject where projectid=?";
		ProjectDao project=null;
		try {
			project=(ProjectDao) jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper(ProjectDao.class));
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return project;
	}

	@Override
	public int InsertProject(ProjectDao project) {
		
		String sql="Insert into TBLPROJECT (PROJECTNAME,HANDOVERDATE,CITY,COUNTRY,CUSTOMERNAME,CUSTOMERNO,OPERATIONMANAGER,TECHNICALMANAGER,ACCOUNTMANAGER,DELIVERYMANAGER,MODIFYBY,VERSION,CLOSEDFLAG,SUPPORTTYPE)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println("Project "+project);
		int result=jdbcTemplate.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, project.getProjectname());
				ps.setDate(2, project.getHandoverdate());
				ps.setString(3, project.getCity());
				ps.setString(4, project.getCountry());
				ps.setString(5, project.getCustomername());
				ps.setString(6, project.getCustomerno());
				ps.setString(7, project.getOperationmanager());
				ps.setString(8, project.getTechnicalmanager());
				ps.setString(9, project.getAccountmanager());
				ps.setString(10, project.getDeliverymanager());
				ps.setString(11, project.getModifyby());
				//ps.setDate(12, project.getCreatedate());
				ps.setString(12, project.getVersion());
				ps.setString(13, project.getClosedflag());
				ps.setString(14, project.getSupporttype());
			}
		});
		//System.out.println("Result is "+result);
		 
		return result;
	}

	@Override
	public ArrayList<ProjectDao> getAllProject() {
		String sql="select * from tblproject order by projectid";
		ArrayList<ProjectDao> listProject=null;
		try {
			listProject=(ArrayList<ProjectDao>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(ProjectDao.class));
			
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return listProject;
	}

}
