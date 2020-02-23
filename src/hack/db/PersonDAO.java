package hack.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hack.fields.Person;

public class PersonDAO {
	Connection conn;
	public PersonDAO() throws SQLException{
		conn = DataBase.getConnection();
	}
	
	public Person checkPerson(String phone,String pass){
		try{
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM person WHERE number=? AND password=?");
			ps.setString(1, phone);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			return setPerson(rs);
		}
		catch(SQLException ex){
			ex.printStackTrace();
			return null;
		}
	}
	
	public boolean updatePerson(Person farmer){
		Person f = checkPerson(farmer.phone, farmer.password);
		System.out.println(f);
		if(f == null){
			try {
				PreparedStatement ps = conn.prepareStatement("INSERT INTO person(name,password,number,state,district,role) VALUES(?,?,?,?,?,?)");
				ps.setString(1, farmer.name);
				ps.setString(2, farmer.password);
				ps.setString(3, farmer.phone);
				ps.setString(4, farmer.state);
				ps.setString(5, farmer.district);
				ps.setString(6, farmer.role);
				return (ps.executeUpdate() > 0);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		else{
			try {
				PreparedStatement ps = conn.prepareStatement("UPDATE person set name=?, password=?, state=?, district=? WHERE Id=?");
				ps.setString(1, farmer.name);
				ps.setString(2, farmer.password);
				ps.setString(3, farmer.state);
				ps.setString(4, farmer.district);
				ps.setLong(5, f.id);
				return (ps.executeUpdate() > 0);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
	}
	
	private Person setPerson(ResultSet rs) throws SQLException{
		if (rs.next()){
			Person f = new Person();
			f.name = rs.getString("name");
			f.password = rs.getString("password");
			f.phone = rs.getString("number");
			f.id = rs.getLong("id");
			f.state = rs.getString("state");
			f.district = rs.getString("district");
			f.role = rs.getString("role");
			rs.close();
			return f;
		}
		return null;
	}
	
	public Person getPerson(Long id){		
		try{
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM person WHERE id=?");
			ps.setLong(1, id);
			
			ResultSet rs = ps.executeQuery();			
			return setPerson(rs);
		}
		catch(SQLException ex){
			return null;
		}
	}
}
