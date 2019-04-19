package ServiceInterface;

import java.util.ArrayList;

import Dao.PODao;

public interface POService {

	
	public  int addPO(PODao po);
	public int updatePO(int id,PODao po);
	public PODao getPOByID(int id);
	public ArrayList<PODao> getAllPO();
}
