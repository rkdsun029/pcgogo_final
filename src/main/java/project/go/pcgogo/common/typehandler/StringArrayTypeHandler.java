package project.go.pcgogo.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement pstmt, int columnIndex, String[] param, JdbcType jdbcType) throws SQLException {
		//질의 던질때
		if(param != null) {
			pstmt.setString(columnIndex, String.join(",", param));
		}
		else {
			pstmt.setString(columnIndex,  "");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String str = rs.getString(columnName);
		
		String[] strArr = null;
		if(str != null) strArr = str.split(",");
		return strArr;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String str = rs.getString(columnIndex);
		
		String[] strArr = null;
		if(str != null) strArr = str.split(",");
		return strArr;
	}

	@Override
	public String[] getResult(CallableStatement cstmt, int columnIndex) throws SQLException {
		String str = cstmt.getString(columnIndex);
		
		String[] strArr = null;
		if(str != null) strArr = str.split(",");
		return strArr;
	}

}
