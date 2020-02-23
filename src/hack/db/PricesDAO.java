package hack.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hack.fields.Prices;

public class PricesDAO {
	Connection conn;
	public PricesDAO() throws SQLException{
		conn = DataBase.getConnection();
	}
	
	public List<Prices> getData(String district){
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM prices WHERE district=?");
			ps.setString(1, district);
			
			List<Prices> prices = new ArrayList();
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Prices p = new Prices();
				p.commodity = rs.getString("commodity");
				p.state = rs.getString("state");
				p.max_price = rs.getInt("max_price");
				p.min_price = rs.getInt("min_price");
				p.modal_price = rs.getInt("modal_price");
				p.variety = rs.getString("variety");
				p.district = rs.getString("district");
				prices.add(p);
			}
			return prices;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
