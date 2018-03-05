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
public class User {
    
    private String username;
    private boolean isAdmin;
    private int saldo;
    private int userId;

    public User(String username, int saldo, int userId, boolean isAdmin) {
        this.username = username;
        this.isAdmin = isAdmin;
        this.saldo = saldo;
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public int getSaldo() {
        return saldo;
    }

    public String getUsername() {
        return username;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }
    
    public void addSaldo(int amount){
        saldo += amount;
    }

    @Override
    public String toString() {
        return "Username: " + username + " Admin: " + isAdmin + " Saldo: " + saldo;
    }
    
}
