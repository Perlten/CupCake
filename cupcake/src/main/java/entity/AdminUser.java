/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Perlt
 */
public class AdminUser extends User {
    
    
    public AdminUser(String username, int saldo, boolean isAdmin, int userId) {
        super(username, saldo, userId, isAdmin);
    }
}
