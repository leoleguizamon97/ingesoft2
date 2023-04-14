package co.edu.unal.software_engineering.labs.repository;

import co.edu.unal.software_engineering.labs.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{

	@Query( value="SELECT * FROM role ORDER BY role_id ASC ", nativeQuery=true)
	List<Role> getRoles();

}
