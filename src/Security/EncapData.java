package Security;

public class EncapData {

    private static String username;
    private static String password;
    private static String logvalue;

    public void setUname(String name) {
        this.username = name;
    }

    public String getUname() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
    
    public void setLoginValue(String lgvalue){
        this.logvalue = lgvalue;
    }
    
    public String getLogValue(){
    return logvalue;
    }

}
