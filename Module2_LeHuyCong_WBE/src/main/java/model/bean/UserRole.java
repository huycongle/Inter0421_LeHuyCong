package model.bean;

public class UserRole {
    private int userRoleId;
    private String userName;

    public UserRole(int userRoleId, String userName) {
        this.userRoleId = userRoleId;
        this.userName = userName;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
