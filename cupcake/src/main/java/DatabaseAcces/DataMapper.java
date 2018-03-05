/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseAcces;

import entity.AdminUser;
import entity.Bottom;
import entity.OrderEntity;
import entity.Topping;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author Perlt
 */
public class DataMapper implements DataMapperInterface {

    DBConnector DBCon;

    public DataMapper(DataSource dataSource) throws SQLException {
        this.DBCon = new DBConnector(dataSource);
    }

    public DataMapper() throws SQLException {
        this(new DataSource1().getDataSource());
    }

    @Override
    public User getUser(String username, String password) {
        User user = null;
        String sql = "SELECT userId, username, admin, saldo FROM userTable WHERE username = ? AND password = ?";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                String DBUsername = resultSet.getString("username");
                boolean isAdmin = resultSet.getBoolean("admin");
                int saldo = resultSet.getInt("saldo");
                int userId = resultSet.getInt("userId");
                user = new User(DBUsername, saldo, userId, isAdmin);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    @Override
    public User getUser(int id) {
        User user = null;
        String sql = "SELECT userId, username, admin FROM userTable WHERE userId = ?";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, id);

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                String DBUsername = resultSet.getString("username");
                boolean isAdmin = resultSet.getBoolean("admin");
                int saldo = resultSet.getInt("saldo");
                int userId = resultSet.getInt("userId");
                user = new User(DBUsername, saldo, userId, isAdmin);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean usernameTaken(String username) {
        String sql = "SELECT username, admin FROM userTable WHERE username = ?";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setString(1, username);

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public double getBottomPrice(String bottom) {

        double ans = 0;
        String sql = "SELECT price FROM bottomTable WHERE bottom = ?";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setString(1, bottom);

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                ans = resultSet.getDouble("price");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ans;
    }

    @Override
    public double getToppingsPrice(String name) {
        double ans = 0;
        String sql = "SELECT price FROM toppingsTable WHERE topping = ?";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setString(1, name);

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                ans = resultSet.getDouble("price");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ans;
    }

    @Override
    public void MakeUser(String username, String password) {
        String sql = "INSERT INTO userTable(username, password) VALUES(?, ?)";
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<Topping> getToppingList() {
        String sql = "SELECT topping, price FROM toppingsTable";
        List<Topping> list = new ArrayList<>();

        try {
            DBCon.open();
            ResultSet resultSet = DBCon.executeQuery(sql);

            while (resultSet.next()) {
                String topping = resultSet.getString("topping");
                int price = resultSet.getInt("price");
                list.add(new Topping(topping, price));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Bottom> getBottomList() {
        String sql = "SELECT bottom, price FROM bottomTable";
        List<Bottom> list = new ArrayList<>();

        try {
            DBCon.open();
            ResultSet resultSet = DBCon.executeQuery(sql);

            while (resultSet.next()) {
                String bottom = resultSet.getString("bottom");
                int price = resultSet.getInt("price");
                list.add(new Bottom(bottom, price));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    @Override
    public List<AdminUser> AdminAccess(String sql, User user) {
        if (!user.isIsAdmin() || sql.startsWith(";")) {
            throw new IllegalAccessError("User is not admin");
        }

        String basicSql = "SELECT * FROM userTable";
        if (!sql.equals("")) {
            basicSql += " WHERE " + sql;
        }

        List<AdminUser> list = new ArrayList<>();

        try {
            DBCon.open();
            ResultSet resultSet = DBCon.executeQuery(basicSql);

            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String username = resultSet.getString("username");
                int saldo = resultSet.getInt("saldo");
                boolean isAdmin = resultSet.getBoolean("admin");
                list.add(new AdminUser(username, saldo, isAdmin, userId));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;

    }

    public boolean deleteUser(User user, int id) {
        if (!user.isIsAdmin()) {
            return false;
        }

        String sql = "DELETE FROM userTable WHERE userId = ?";

        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, id);
            ps.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public boolean makeAdmin(User user, int id) {
        if (!user.isIsAdmin()) {
            return false;
        }

        String sql = "UPDATE userTable SET admin=1 WHERE userId=?";

        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public void addFunds(User user) {
        String sql = "UPDATE userTable SET saldo=? WHERE username=?";

        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, user.getSaldo());
            ps.setString(2, user.getUsername());
            ps.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void writeToOrder(List<OrderEntity> list, User user) {
        int orderId = getLastOrderId() + 1;
        String sql = "INSERT INTO orderTable(orderId, topping, bottom, price, amount) VALUES(?,?,?,?,?)";
        String sql2 = "INSERT INTO MiddleOrderTable(userId, orderId) values(?,?)";
        try {
            PreparedStatement ps = DBCon.preparedStatement(sql);
            PreparedStatement ps2 = DBCon.preparedStatement(sql2);
            for (OrderEntity x : list) {
                ps.setInt(1, orderId);
                ps.setString(2, x.getTopping());
                ps.setString(3, x.getBottom());
                ps.setDouble(4, x.getPrice());
                ps.setInt(5, x.getAmount());
                ps2.setInt(1, user.getUserId());
                ps2.setInt(2, orderId);
                ps.execute();
                ps2.execute();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private int getLastOrderId() {
        String sql = "SELECT * FROM orderTable";
        try {
            DBCon.open();
            ResultSet res = DBCon.executeQuery(sql);

            while (res.last()) {
                return res.getInt("orderId");
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public List<OrderEntity> getListByUserId(User user) {

        String sql = "select * from orderTable where orderId in (select orderId from MiddleOrderTable where userId = ?)";
        List<OrderEntity> list = new ArrayList<>();
        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, user.getUserId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderEntity(rs.getString("topping"), rs.getString("bottom"), rs.getInt("price"), rs.getInt("orderId"), rs.getInt("amount")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<OrderEntity> getAllOrders(User user) {
        if (!user.isIsAdmin()) {
            throw new IllegalAccessError("Not admin user");
        }

        String sql = "SELECT * FROM orderTable";

        List<OrderEntity> list = new ArrayList<>();
        try {
            DBCon.open();
            ResultSet rs = DBCon.executeQuery(sql);
            while (rs.next()) {
                list.add(new OrderEntity(rs.getString("topping"), rs.getString("bottom"), rs.getInt("price"), rs.getInt("orderId"), rs.getInt("amount")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void makeNewCupCake(String type, String name, int price, User user) {
        if (!user.isIsAdmin()) {
            throw new IllegalAccessError("Not admin user");
        }

        try {
            if (type.equals("topping")) {
                String sql = "INSERT INTO toppingsTable(topping, price) VALUES(?,?)";
                DBCon.open();
                PreparedStatement ps = DBCon.preparedStatement(sql);
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.execute();
            } else {
                String sql = "INSERT INTO bottomTable(bottom, price) VALUES(?,?)";
                DBCon.open();
                PreparedStatement ps = DBCon.preparedStatement(sql);
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.execute();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<OrderEntity> getOrderListById(int id) {

        String sql = "SELECT * FROM orderTable where orderId = ?";

        List<OrderEntity> list = new ArrayList<>();

        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, id);

            ResultSet res = ps.executeQuery();

            while (res.next()) {
                int orderId = res.getInt("orderId");
                String topping = res.getString("topping");
                String bottom = res.getString("bottom");
                int price = res.getInt("price");
                int amount = res.getInt("amount");

                list.add(new OrderEntity(topping, bottom, price, orderId, amount));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void changePrice(int orderId, int newPrice, String topping, String bottom) {

        String sql = "UPDATE orderTable SET price = ? where orderId = ? and topping = ? and bottom = ?";

        try {
            DBCon.open();
            PreparedStatement ps = DBCon.preparedStatement(sql);
            ps.setInt(1, newPrice);
            ps.setInt(2, orderId);
            ps.setString(3, topping);
            ps.setString(4, bottom);
            ps.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        DataMapper dm = new DataMapper();

        List<OrderEntity> list = dm.getListByUserId(new User("Perlt", 123, 21, false));

        System.out.println(list.get(0).getOrderId());
    }

}
