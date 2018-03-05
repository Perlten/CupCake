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
import java.util.List;

/**
 *
 * @author Perlt
 */
public interface DataMapperInterface {
 
    public User getUser(String userName, String password);
    public User getUser(int id);
    
    public boolean usernameTaken(String username);
    
    public double getBottomPrice(String bottom);
    public double getToppingsPrice(String name);
    public List<Topping> getToppingList();
    public List<Bottom> getBottomList();
    
    public void MakeUser(String username, String password);
    
    public List<AdminUser> AdminAccess(String sql, User user);
    public boolean deleteUser(User user, int id);
    public boolean makeAdmin(User user, int id);
    
    public void addFunds(User user);
    public void writeToOrder(List<OrderEntity> list, User user);
    public List<OrderEntity> getListByUserId(User user);
}
