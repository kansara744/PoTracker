package Service;

import java.util.Iterator;

import javax.sql.DataSource;

import org.apache.catalina.Group;
import org.apache.catalina.Role;
import org.apache.catalina.User;
import org.apache.catalina.UserDatabase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import ServiceInterface.UsernameService;

@Service
public class UsernameServiceImpl implements UsernameService {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Bean
	public void jdbcTemplate(DataSource dataSource) {
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
	}

	
	
	@Override
	public boolean checkUsername(String username) {
		String sql="select * from TBLUSERNAME where username=?";
		boolean flag=false;
		try {
		String Uname=(String) jdbcTemplate.queryForObject(sql, new Object[] {username},new BeanPropertyRowMapper(String.class));
		if(Uname != null) {
			flag=true;
		}
		
		}catch (Exception e) {
			System.out.println(e);
		
		}
		
		
		return flag;
	}
	

}
