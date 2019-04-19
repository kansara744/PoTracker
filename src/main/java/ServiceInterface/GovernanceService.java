package ServiceInterface;

import java.util.ArrayList;

import Dao.GovernanceDao;

public interface GovernanceService {

	
	public int addGoverance(GovernanceDao gov);
	public int updateGoverance(GovernanceDao gov);
	public GovernanceDao getGovernanceById(int gvid);
	public ArrayList<GovernanceDao> getAllGoverance();
}
