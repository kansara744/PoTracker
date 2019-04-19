package ServiceInterface;

import java.util.ArrayList;

import Dao.ProjectDao;

public interface ProjectService {

	public ProjectDao getProjectById(int id);
	public int InsertProject(ProjectDao project);
	public ArrayList<ProjectDao> getAllProject();
}
