package DatabaseAcces;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DataSource1 {
    
    private MysqlDataSource dataSource = new MysqlDataSource();

    public DataSource1() {
        dataSource.setServerName("159.89.99.250");
        dataSource.setPort(3306);
        dataSource.setUser("perlt");
        dataSource.setPassword("admin");
        dataSource.setDatabaseName("cupcake");
        //Hej med dig
        //lolo
    }
    
    public MysqlDataSource getDataSource(){
        return dataSource;
    }
  
}
